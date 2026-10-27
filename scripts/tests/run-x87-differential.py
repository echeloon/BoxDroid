#!/usr/bin/env python3
"""Compile the actual ARM64 downstream and pinned SoftFloat objects, then compare.
Requires the existing Android native build's configured headers/dependencies.
No changes to the upstream checkout. Results are written under build/.
"""
import argparse,json,shlex,subprocess,sys
from pathlib import Path

sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import ndk

ROOT=Path(__file__).resolve().parents[2]
B=ROOT/'build/native/android-arm64'
OUT=ROOT/'build/production-correction/x87'
NDK=ndk.get_llvm_bin()

def run(*args,**kw):
    return subprocess.run(*args,check=True,**kw)

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--iterations',type=int,default=100000)
    parser.add_argument('--compile-only',action='store_true',help='build the harness without operating the device')
    args=parser.parse_args();OUT.mkdir(parents=True,exist_ok=True)
    entries=json.loads((B/'compile_commands.json').read_text())
    entry=next(e for e in entries if e['file'].endswith('fpu/softfloat.c') and 'libcommon' in e['command'])
    flags=[];cmd=shlex.split(entry['command']);i=0
    while i<len(cmd):
        if cmd[i] in ('-o','-MQ','-MF'):i+=2;continue
        if cmd[i] in ('-c','-MD','-flto=thin') or cmd[i].endswith('/fpu/softfloat.c'):i+=1;continue
        flags.append(cmd[i]);i+=1
    flags+=['-fno-lto','-DBOXDROID_FAST_FPU_TEST=1']
    for name,source in [('reference',ROOT/'upstream/xemu/fpu/softfloat.c'),('candidate',ROOT/'build/native/source/xemu/fpu/softfloat.c')]:
        run(flags+['-c',str(source),'-o',str(OUT/(name+'.o'))],cwd=B)
    symbols=subprocess.check_output([str(NDK/'llvm-nm'),'--defined-only','--extern-only',str(OUT/'reference.o')],text=True)
    mapping=OUT/'reference-symbols.txt'
    mapping.write_text(''.join(f'{line.split()[-1]} ref_{line.split()[-1]}\n' for line in symbols.splitlines() if line.strip()))
    run([str(NDK/'llvm-objcopy'),'--redefine-syms='+str(mapping),str(OUT/'reference.o')])
    run(flags+['-c',str(ROOT/'scripts/tests/test-x87-fast.c'),'-o',str(OUT/'test.o')],cwd=B)
    lib=ROOT/'native/android/vcpkg_installed/arm64-android-api33/lib'
    run([str(NDK/'aarch64-linux-android33-clang'),str(OUT/'test.o'),str(OUT/'candidate.o'),str(OUT/'reference.o'),'-Wl,--start-group',str(lib/'libglib-2.0.a'),str(lib/'libintl.a'),str(lib/'libpcre2-8.a'),'-Wl,--end-group','-lm','-ldl','-llog','-o',str(OUT/'test-x87')])
    if args.compile_only:
        print('Compiled',OUT/'test-x87');return
    run(['adb','push',str(OUT/'test-x87'),'/data/local/tmp/boxdroid-test-x87'])
    # The property is the production control; preserve it after the test.
    old=subprocess.check_output(['adb','shell','getprop','debug.boxdroid.fast_fpu'],text=True).strip()
    try:
        run(['adb','shell','setprop','debug.boxdroid.fast_fpu','1'])
        r=subprocess.run(['adb','shell','/data/local/tmp/boxdroid-test-x87',str(args.iterations)],capture_output=True,text=True)
        (OUT/'result.txt').write_text(r.stdout+r.stderr)
        print(r.stdout,end='');print(r.stderr,end='')
        if r.returncode:raise SystemExit(r.returncode)
    finally:
        run(['adb','shell','setprop','debug.boxdroid.fast_fpu',old])
if __name__=='__main__':main()
