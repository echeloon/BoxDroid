import json, re, shlex, subprocess, sys
from pathlib import Path
p=Path(sys.argv[1]);controls=dict(arg.split('=',1) for arg in sys.argv[2:]);adb=['adb','-s','20537a44'];prefix='/data/local/tmp/boxdroid-tcg-state-tests'
previous={k:subprocess.check_output(adb+['shell','getprop','debug.boxdroid.'+k],text=True).strip() for k in controls}
identity=json.loads((p/'identity.json').read_text());identity['device_controls']=controls;(p/'identity.json').write_text(json.dumps(identity,indent=2)+'\n')
subprocess.run(adb+['push',str(p/'test-tcg'),prefix],check=True)
try:
 for k,v in controls.items():subprocess.run(adb+['shell','setprop','debug.boxdroid.'+k,v],check=True)
 with (p/'result.log').open('w') as log:
  subprocess.run(adb+['shell','LD_LIBRARY_PATH=/data/local/tmp '+prefix],stdout=log,stderr=subprocess.STDOUT,check=True)
finally:
 for k,v in previous.items():subprocess.run(adb+['shell','setprop debug.boxdroid.'+k+' '+shlex.quote(v)],check=True)
result=(p/'result.log').read_text();print(result)
if re.search(r'ERROR:|Bail out!|assertion failed|SILENT_CRASH|FATAL',result):raise RuntimeError('Device test failure')

if "actual TCG MMX full-state differential: 2048 cases; SMC, #NM, MMIO visibility, precise #PF PASS" not in result:
 raise RuntimeError("Focused suite did not reach final completion marker")
