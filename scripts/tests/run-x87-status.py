#!/usr/bin/env python3
"""Link the actual pinned x87 helpers with corrected SoftFloat; test on RP5."""
import json,shlex,subprocess
from pathlib import Path
R=Path(__file__).resolve().parents[2];B=R/'build/native/android-arm64';O=R/'build/production-correction/x87'
N=Path.home()/'Library/Android/sdk/ndk/30.0.16248370/toolchains/llvm/prebuilt/darwin-x86_64/bin'
entries=json.loads((B/'compile_commands.json').read_text())
e=next(e for e in entries if e['file'].endswith('/target/i386/tcg/fpu_helper.c'))
c=shlex.split(e['command']);f=[];i=0
while i<len(c):
 if c[i] in ('-o','-MQ','-MF'):i+=2;continue
 if c[i] in ('-c','-MD','-flto=thin') or c[i].endswith('/fpu_helper.c'):i+=1;continue
 f.append(c[i]);i+=1
f+=['-fno-lto','-ffunction-sections','-fdata-sections']
for name,source in [('helpers',R/'build/native/source/xemu/target/i386/tcg/fpu_helper.c'),('status-test',R/'scripts/tests/test-x87-status.c')]:
 subprocess.run(f+['-c',str(source),'-o',str(O/(name+'.o'))],cwd=B,check=True)
lib=R/'native/android/vcpkg_installed/arm64-android-api33/lib'
subprocess.run([str(N/'aarch64-linux-android33-clang'),str(O/'status-test.o'),str(O/'helpers.o'),str(O/'candidate.o'),'-Wl,--gc-sections','-Wl,--start-group',str(lib/'libglib-2.0.a'),str(lib/'libintl.a'),str(lib/'libpcre2-8.a'),'-Wl,--end-group','-lm','-ldl','-llog','-o',str(O/'test-status')],check=True)
subprocess.run(['adb','push',str(O/'test-status'),'/data/local/tmp/boxdroid-test-status'],check=True)
r=subprocess.run(['adb','shell','/data/local/tmp/boxdroid-test-status'],capture_output=True,text=True)
(O/'status-result.txt').write_text(r.stdout+r.stderr);print(r.stdout+r.stderr)
raise SystemExit(r.returncode)
