#!/usr/bin/env python3
"""Extract the real backend encoding expression and execute its ISA contract."""
from pathlib import Path
import re,subprocess
R=Path(__file__).resolve().parents[2];O=R/'build/production-correction/ordering';O.mkdir(parents=True,exist_ok=True)
source=(R/'build/native/source/xemu/tcg/aarch64/tcg-target.c.inc').read_text()
requirements=(R/'build/native/source/xemu/tcg/tcg-op-ldst.c').read_text()
assert re.search(r'if \(tcg_ctx->boxdroid_helper_prefix[^}]*MO_128[^}]*type = TCG_MO_LD_ST \| TCG_MO_ST_ST;', requirements), 'Conservative i128 Load->Store requirement missing'
body=source[source.index('static void tcg_out_qemu_st_direct'):]
m=re.search(r'tcg_out32\(s, (UINT32_C\(0x089ffc00\)[^;]+)\);',body)
assert m, 'Production release-store emitter not found'
expression=m.group(1)
load=re.search(r'tcg_out32\(s, (opcode[^;]+)\);',source)
assert load, 'Production acquire-load emitter not found'
opcodes=re.search(r'uint32_t opcode =[^?]+\?\s*(UINT32_C\(0x[0-9a-f]+\))\s*:\s*(UINT32_C\(0x[0-9a-f]+\))',source)
assert opcodes
(O/'store-encoding.h').write_text('#include <stdbool.h>\n#define MO_SIZE 3\nstatic uint32_t backend_store_encoding(unsigned memop, unsigned base, unsigned data_r) { return '+expression+'; }\nstatic uint32_t backend_load_encoding(unsigned memop, unsigned base, unsigned data_r, bool rcpc) { uint32_t opcode = rcpc ? '+opcodes.group(1)+' : '+opcodes.group(2)+'; return '+load.group(1)+'; }\n')
N=Path.home()/'Library/Android/sdk/ndk/30.0.16248370/toolchains/llvm/prebuilt/darwin-x86_64/bin'
subprocess.run([str(N/'aarch64-linux-android33-clang'),'-O2','-pthread','-I'+str(O),str(R/'scripts/tests/test-arm64-order.c'),'-o',str(O/'test-order')],check=True)
subprocess.run(['adb','push',str(O/'test-order'),'/data/local/tmp/boxdroid-test-order'],check=True)
r=subprocess.run(['adb','shell','/data/local/tmp/boxdroid-test-order'],capture_output=True,text=True)
(O/'result.txt').write_text(r.stdout+r.stderr);print(r.stdout+r.stderr)
raise SystemExit(r.returncode)
