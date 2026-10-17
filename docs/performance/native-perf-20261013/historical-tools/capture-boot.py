import subprocess,time,sys,json
from pathlib import Path
label,mode=sys.argv[1:];out=Path('build/native-perf-run')
def adb(*args):subprocess.run(['adb',*args],check=True,stdout=subprocess.DEVNULL)
adb('shell','am','force-stop','org.boxdroid')
adb('shell','setprop','debug.boxdroid.defer_globals',mode)
adb('shell','setprop','debug.boxdroid.boot_trace','1')
adb('shell','am','start','-n','org.boxdroid/.FrontendActivity')
time.sleep(3);adb('shell','input','tap','960','460')
time.sleep(2);adb('shell','input','tap','400','360')
time.sleep(15)
with (out/(label+'.log')).open('wb') as f:
    subprocess.run(['adb','exec-out','run-as','org.boxdroid','cat','files/boot-trace.log'],stdout=f,check=True)
with (out/(label+'.png')).open('wb') as f:
    subprocess.run(['adb','exec-out','screencap','-p'],stdout=f,check=True)
adb('shell','am','force-stop','org.boxdroid')
print(label,mode,'captured',flush=True)
