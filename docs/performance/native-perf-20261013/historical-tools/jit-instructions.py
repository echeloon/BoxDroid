import bisect, collections, json, re, struct, subprocess, sys
from pathlib import Path
cap=Path(sys.argv[1]); blob=Path(sys.argv[2]).read_bytes();p=0;blocks={}
while p+64<=len(blob):
 magic,host,pc,size,count,words,flags,cflags=struct.unpack_from('<8Q',blob,p)
 assert magic==0x424454434744554d
 end=p+64+count*words*8+count*2+size
 if end>len(blob):break
 blocks[host]=(size, blob[end-size:end]);p=end
starts=sorted(blocks);word_hits=collections.Counter();before_hits=collections.Counter()
for line in (cap/'native-raw.txt').read_text().splitlines():
 m=re.match(r'(\d+)\s+(\d+)\s+\d+\s+ALL CPUs/TCG\s+(.*)',line)
 if not m:continue
 a=re.search(r'unknown\[\+([0-9a-f]+)\]',m[3])
 if not a:continue
 address=int(a[1],16);i=bisect.bisect_right(starts,address)-1
 if i<0:continue
 size,code=blocks[starts[i]];off=address-starts[i]
 if off+4>size or off%4:continue
 weight=int(m[1]);word_hits[struct.unpack_from('<I',code,off)[0]]+=weight
 if off>=4: before_hits[struct.unpack_from('<I',code,off-4)[0]]+=weight
words=sorted(set(word_hits)|set(before_hits));out=cap/'sampled-instructions';out.with_suffix('.s').write_text('.text\n'+''.join('.inst 0x%08x\n'%w for w in words))
llvm=Path('/Users/maverick/Library/Android/sdk/ndk/30.0.16248370/toolchains/llvm/prebuilt/darwin-x86_64/bin')
subprocess.run([str(llvm/'clang'),'-target','aarch64-linux-android33','-c',str(out.with_suffix('.s')),'-o',str(out.with_suffix('.o'))],check=True)
raw=subprocess.check_output([str(llvm/'llvm-objdump'),'-d','--no-show-raw-insn',str(out.with_suffix('.o'))],text=True);mnems={};details={}
for line in raw.splitlines():
 m=re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)',line)
 if m:
  idx=int(m[1],16)//4
  if idx<len(words):mnems[words[idx]]=m[2];details[words[idx]]=m[3]
results={}
env_offsets=collections.Counter()
for w,c in word_hits.items():
 detail=details.get(w,'')
 if '[x19' in detail:
  m=re.search(r'\[x19(?:,\s*#(-?0x[0-9a-f]+|-?\d+))?\]',detail)
  if m:
   offset=int(m[1],0) if m[1] else 0
   env_offsets[(offset,mnems.get(w,'?'))]+=c
results['env_offsets']=[{'offset':hex(off),'mnemonic':mn,'weight':c,
                         'mapped_jit_fraction':c/sum(word_hits.values())}
                        for (off,mn),c in env_offsets.most_common(40)]
for name,hits in [('sampled',word_hits),('preceding',before_hits)]:
 total=sum(hits.values());hist=collections.Counter();env=collections.Counter()
 for w,c in hits.items():
  mn=mnems.get(w,'?');hist[mn]+=c
  if 'x19' in details.get(w,''):env[mn]+=c
 results[name]={'total_weight':total,'mnemonics':[(k,c,round(c/total*100,3)) for k,c in hist.most_common(30)],'env_memory':dict(env)}
(cap/'jit-instructions.json').write_text(json.dumps(results,indent=2)+'\n');print(json.dumps(results,indent=2))
