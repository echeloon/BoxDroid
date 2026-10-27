#!/usr/bin/env python3
"""Classify sampled generated ARM64 instructions in an existing diagnostic capture.

Weights are sampled CPU time, not exact retired-instruction counts. Sampling skid
and reused JIT addresses limit attribution. No category is a removable-cost bound.
"""
import argparse,bisect,collections,gzip,json,re,struct,subprocess,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
import ndk
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('host_dump',type=Path);p.add_argument('raw_report',type=Path);p.add_argument('output',type=Path)
a=p.parse_args();a.output.mkdir(exist_ok=False,parents=True)
blob=gzip.open(a.host_dump,'rb').read() if a.host_dump.suffix=='.gz' else a.host_dump.read_bytes()
blocks={};pos=0
while pos+64<=len(blob):
 magic,host,pc,size,count,words,flags,cflags=struct.unpack_from('<8Q',blob,pos)
 assert magic==0x424454434744554d,pos
 code=pos+64+count*words*8+count*2;end=code+size
 if end>len(blob):break
 blocks[host]=(size,code,pc);pos=end
starts=sorted(blocks);samples=collections.Counter();total=unmapped=0
for line in a.raw_report.read_text().splitlines():
 m=re.match(r'(\d+)\s+\d+\s+\d+\s+ALL CPUs/TCG\s+(.*)',line)
 if not m:continue
 weight=int(m[1]);total+=weight
 match=re.search(r'unknown\[\+([0-9a-f]+)\]',m[2])
 if not match:continue
 addr=int(match[1],16);i=bisect.bisect_right(starts,addr)-1
 if i<0:unmapped+=weight;continue
 base=starts[i];size,offset,pc=blocks[base];delta=addr-base
 if delta%4 or delta+4>size:unmapped+=weight;continue
 word=struct.unpack_from('<I',blob,offset+delta)[0]
 samples[word]+=weight
opcodes=sorted(samples)
assembly=a.output/'sampled-opcodes.s';assembly.write_text('.text\n.global sampled_opcodes\nsampled_opcodes:\n'+''.join('.inst 0x%08x\n'%word for word in opcodes))
llvm=ndk.get_llvm_bin()
subprocess.run([str(llvm/'clang'),'-target','aarch64-linux-gnu','-c',str(assembly),'-o',str(a.output/'sampled-opcodes.o')],check=True)
asm=subprocess.check_output([str(llvm/'llvm-objdump'),'-d','--no-show-raw-insn',str(a.output/'sampled-opcodes.o')],text=True)
(a.output/'sampled-opcodes.asm').write_text(asm)
decoded={}
for line in asm.splitlines():
 m=re.match(r'\s*([0-9a-f]+):\s+(\S+)\s*(.*)',line)
 if m:decoded[int(m[1],16)//4]=(m[2],m[3])
categories=collections.Counter();mnemonics=collections.Counter();env_access=collections.Counter();instructions=collections.Counter()
for i,word in enumerate(opcodes):
 mnemonic,operands=decoded.get(i,('unknown',''));weight=samples[word];mnemonics[mnemonic]+=weight;instructions[mnemonic+' '+operands]+=weight
 memory=bool(re.search(r'\[(?:x\d+|sp)',operands))
 if memory:
  category='CPU-env based memory' if '[x19' in operands else 'stack based memory' if '[sp' in operands else 'other memory'
  if category=='CPU-env based memory':env_access[mnemonic+' '+operands]+=weight
 elif mnemonic in ('dmb','dsb','isb'):category='explicit barrier'
 elif mnemonic in ('bl','blr'):category='call'
 elif mnemonic in ('ret','br','b','cbz','cbnz','tbz','tbnz') or mnemonic.startswith('b.'):category='branch/return'
 else:category='other computation'
 categories[category]+=weight
result={'tcg_total_weight':total,'mapped_jit_weight':sum(samples.values()),'unmapped_jit_weight':unmapped,'unique_sampled_opcodes':len(opcodes),'categories':{k:{'weight':v,'fraction_of_tcg':v/total} for k,v in categories.most_common()},'top_instructions':instructions.most_common(60),'top_mnemonics':mnemonics.most_common(35),'top_env_accesses':env_access.most_common(40),'limits':'CPU-clock self samples with skid/address reuse limits; categories are not removable-cost bounds. CPU-env memory includes TLB fields. Branch target addresses shown by the temporary decode object are synthetic and cannot establish original control flow. Stack memory includes spills and other generated stack accesses. Other memory includes guest RAM, TLB-derived pointers, and helper-related pointers.'}
(a.output/'summary.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))
