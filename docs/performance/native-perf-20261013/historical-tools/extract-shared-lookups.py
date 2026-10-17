import collections,json,re,struct,subprocess,sys
from pathlib import Path
cap=Path(sys.argv[1]);blob=Path(sys.argv[2]).read_bytes();p=0;blocks={}
def sext26(value):
 value &= 0x3ffffff
 return value-(1<<26) if value&(1<<25) else value
while p+64<=len(blob):
 magic,host,pc,size,count,words,flags,cflags=struct.unpack_from('<8Q',blob,p)
 assert magic==0x424454434744554d
 end=p+64+count*words*8+count*2+size
 if end>len(blob):break
 blocks[host]=(pc,blob[end-size:end]);p=end
stubs={}
for host,(pc,code) in blocks.items():
 for off in range(0,len(code)-8,4):
  w=struct.unpack_from('<I',code,off)[0]
  if w&0xfc000000 != 0x14000000:continue
  target=off+sext26(w)*4
  if not off+128<target or target+4>len(code):continue
  if struct.unpack_from('<I',code,target-4)[0]!=0xd65f03c0:continue
  call=struct.unpack_from('<I',code,target)[0]
  if call&0xfc000000 != 0x94000000 or target+sext26(call)*4!=off+4:continue
  stubs[host+off+4]={'host':host+off+4,'size':target-off-4,'container_pc':pc,'code':code[off+4:target],'weight':0,'samples':0}
for line in (cap/'native-raw.txt').read_text().splitlines():
 m=re.match(r'(\d+)\s+(\d+)\s+\d+\s+ALL CPUs/TCG\s+(.*)',line)
 if not m:continue
 a=re.search(r'unknown\[\+([0-9a-f]+)\]',m[3])
 if not a:continue
 address=int(a[1],16)
 for stub in stubs.values():
  if stub['host']<=address<stub['host']+stub['size']:
   stub['weight']+=int(m[1]);stub['samples']+=int(m[2]);break
llvm=Path('/Users/maverick/Library/Android/sdk/ndk/30.0.16248370/toolchains/llvm/prebuilt/darwin-x86_64/bin')
result=[]
for stub in stubs.values():
 name=cap/('shared-lookup-%x'%stub['host'])
 name.with_suffix('.s').write_text('.text\n'+''.join('.inst 0x%08x\n'%w for w in struct.unpack('<'+'I'*(len(stub['code'])//4),stub['code'])))
 subprocess.run([str(llvm/'clang'),'-target','aarch64-linux-android33','-c',str(name.with_suffix('.s')),'-o',str(name.with_suffix('.o'))],check=True)
 raw=subprocess.check_output([str(llvm/'llvm-objdump'),'-d','--no-show-raw-insn','--adjust-vma='+str(stub['host']),str(name.with_suffix('.o'))],text=True)
 name.with_suffix('.asm').write_text(raw)
 result.append({k:v for k,v in stub.items() if k!='code'})
(cap/'shared-lookups.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
