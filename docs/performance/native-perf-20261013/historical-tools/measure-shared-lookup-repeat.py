import subprocess, sys
from pathlib import Path
mode=sys.argv[1];label='native-run-shared-lookup-repeat-'+('on' if mode=='1' else 'off')
def run(args): subprocess.run(args, check=True)
run(['adb','shell','am','force-stop','org.boxdroid'])
if mode=='1': run(['adb','install','-r','build/native-perf-run/shared-lookup/app.apk'])
for key,value in dict(lookup_shared=mode,tcg_absolute_pc='1',fmul_shared='0',fp_local='1',fp_preserve='1',sse_native='1',jmp_cache2='1',inline_lookup='1',lookup_no_bridges='1',inline_lookup_count='0',diagnostics='0',tcg_dump='0').items():
 run(['adb','shell','setprop','debug.boxdroid.'+key,value])
run(['python3','-u','scripts/tests/correction-device.py','pandora',label+'-navigation','--launch-only'])
run(['python3','-u','scripts/tests/correction-device.py','pandora',label+'-cadence','--attach','--duration','35','--warmup','20'])
