#!/usr/bin/env python3
"""Test the production ownership header with TSAN, or real SRC_STATE on RP5."""
import argparse,subprocess,sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import ndk
R=Path(__file__).resolve().parents[2]
O=R/'build/production-correction';O.mkdir(parents=True,exist_ok=True)
p=argparse.ArgumentParser(description=__doc__);p.add_argument('--android',action='store_true')
a=p.parse_args();header=R/'build/native/source/xemu/hw/xbox/mcpx/apu/vp'
if a.android:
    deps=R/'native/android/vcpkg_installed/arm64-android-api33'
    command=[str(ndk.get_tool('aarch64-linux-android33-clang')),'-O2','-DVOICE_REAL_RESAMPLER',
             '-I'+str(deps/'include')]
    libraries=[str(deps/'lib/libsamplerate.a'),'-lm'];name='voice-android'
else:
    command=['clang','-O1','-g','-fsanitize=thread','-fno-omit-frame-pointer']
    libraries=[];name='voice-tsan'
binary=O/name
subprocess.run(command+['-pthread','-I'+str(header),str(R/'scripts/tests/test-voice-ownership.c')]+libraries+['-o',str(binary)],check=True)
if a.android:
    remote='/data/local/tmp/boxdroid-test-voice'
    subprocess.run(['adb','push',str(binary),remote],check=True)
    command=['adb','shell',remote]
else:command=[str(binary)]
result=subprocess.run(command,capture_output=True,text=True)
(O/(name+'-result.txt')).write_text(result.stdout+result.stderr)
print(result.stdout+result.stderr)
raise SystemExit(result.returncode)
