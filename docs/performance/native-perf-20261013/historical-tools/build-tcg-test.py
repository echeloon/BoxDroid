import json,shlex,subprocess,sys
from pathlib import Path
r=Path.cwd();b=r/'build/native/android-arm64';o=r/'build/native-perf-run'
entries=json.loads((b/'compile_commands.json').read_text())
e=next(e for e in entries if e['file'].endswith('/target/i386/tcg/fpu_helper.c'))
c=shlex.split(e['command']);flags=[];i=0
while i<len(c):
    if c[i] in ['-o','-MQ','-MF']:i+=2;continue
    if c[i] in ['-c','-MD'] or c[i].endswith('/fpu_helper.c'):i+=1;continue
    flags.append(c[i]);i+=1
subprocess.run(flags+['-c',str(o/'test-tcg.c'),'-o',str(o/'test-tcg.o')],cwd=b,check=True)
s=(o/'link-rule.txt').read_text().replace('$ ',' ')
objects=shlex.split(s.splitlines()[0].split(': cpp_LINKER_RSP ',1)[1].split(' | ')[0])
args=shlex.split(s.split(' LINK_ARGS = ',1)[1].splitlines()[0])
args=[x for x in args if x not in ['-shared','-fPIC','-Wl,-soname,libboxdroid.so']]
compiler=Path(flags[0]).with_name('aarch64-linux-android33-clang++')
subprocess.run([str(compiler),'-o',str(o/'test-tcg'),str(o/'test-tcg.o'),*objects,*args],cwd=b,check=True)
print('Built actual full-system TCG harness')
