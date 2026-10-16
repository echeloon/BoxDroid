import bisect,collections,json,re,struct,subprocess,sys
from pathlib import Path
root=Path.cwd();out=root/'build/native-perf-run';capture=Path(sys.argv[1])
ndk=Path('/Users/maverick/Library/Android/sdk/ndk/30.0.16248370')
sp=ndk/'simpleperf/bin/darwin/x86_64/simpleperf'
raw=subprocess.check_output([str(sp),'report','-i',str(capture/'perf.data'),'--raw-period','-n','--sort','tid,comm,symbol'],text=True)
(capture/'native-raw.txt').write_text(raw)
blob=Path(sys.argv[2]).read_bytes() if len(sys.argv)>2 else (out/'tcg-dump.bin').read_bytes();offset=0;blocks={}
while offset+64<=len(blob):
    magic,host,pc,size,count,words,flags,cflags=struct.unpack_from('<8Q',blob,offset)
    assert magic==0x424454434744554d
    end=offset+64+count*words*8+count*2+size
    if end>len(blob):break
    data=struct.unpack_from('<'+'Q'*(count*words),blob,offset+64)
    offs=struct.unpack_from('<'+'H'*count,blob,offset+64+count*words*8)
    blocks[host]={'host':host,'pc':pc,'size':size,'count':count,'flags':flags,'cflags':cflags,'data':data,'offs':offs,'words':words,'code':blob[end-size:end]}
    offset=end
starts=sorted(blocks);hits=collections.Counter();samples=collections.Counter();total=jit=unmapped=0
for line in raw.splitlines():
    m=re.match(r'(\d+)\s+(\d+)\s+\d+\s+ALL CPUs/TCG\s+(.*)',line)
    if not m:continue
    weight=int(m[1]);total+=weight
    addr=re.search(r'unknown\[\+([0-9a-f]+)\]',m[3])
    if not addr:continue
    address=int(addr[1],16);idx=bisect.bisect_right(starts,address)-1
    if idx<0:unmapped+=weight;continue
    b=blocks[starts[idx]]
    if address>=b['host']+b['size']:unmapped+=weight;continue
    hits[b['host']]+=weight;samples[address]+=weight;jit+=weight
result={'tcg_weight':total,'mapped_jit_weight':jit,'unmapped_weight':unmapped,'blocks':len(blocks),'top':[]}
llvm=ndk/'toolchains/llvm/prebuilt/darwin-x86_64/bin'
for host,weight in hits.most_common(20):
    b=blocks[host];pc=b['pc'];entry={'host':hex(host),'guest_pc':hex(pc),'guest_count':b['count'],'host_bytes':b['size'],'tcg_fraction':weight/total,'cflags':hex(b['cflags'])}
    result['top'].append(entry)
    name=out/f'tb-{pc:x}-{host:x}';asm=['.text','.global trace','trace:']
    for n,w in enumerate(struct.unpack('<'+'I'*(b['size']//4),b['code'][:b['size']//4*4])):
        asm.append(f'.inst 0x{w:08x}')
    name.with_suffix('.s').write_text('\n'.join(asm)+'\n')
    subprocess.run([str(llvm/'clang'),'-target','aarch64-linux-android33','-c',str(name.with_suffix('.s')),'-o',str(name.with_suffix('.o'))],check=True)
    dis=subprocess.check_output([str(llvm/'llvm-objdump'),'-d','--no-show-raw-insn','--adjust-vma='+str(host),str(name.with_suffix('.o'))],text=True)
    annotated=[]
    for line in dis.splitlines():
        m=re.match(r'\s*([0-9a-f]+):',line)
        if m:
            address=int(m[1],16);insn=bisect.bisect_right(b['offs'],address-host)
            if insn<b['count']:
                guest=b['data'][insn*b['words']]
                if b['cflags'] & 0x20000:guest=(pc & ~4095)+guest
                line+=f'  // guest 0x{guest:x}, sampled {samples[address]//2000000}'
        annotated.append(line)
    name.with_suffix('.asm').write_text('\n'.join(annotated))
(capture/'jit-summary.json').write_text(json.dumps(result,indent=2));print(json.dumps(result,indent=2))
