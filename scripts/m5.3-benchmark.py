#!/usr/bin/env python3
"""Bounded host-side capture of an already staged M5.3 APK. No guest files changed."""
import argparse,json,pathlib,subprocess,sys,time
p=argparse.ArgumentParser()
p.add_argument('--results',required=True)
p.add_argument('--package',default='org.boxdroid.m53',choices=['org.boxdroid.m53','org.boxdroid.m52'])
p.add_argument('--seconds',type=int,default=45)
a=p.parse_args(); out=pathlib.Path(a.results); out.mkdir(parents=True,exist_ok=True)
activity='PerformanceActivity' if a.package.endswith('m53') else 'OverlayActivity'
def adb(*args,check=True):
 return subprocess.run(['adb',*args],stdout=subprocess.PIPE,stderr=subprocess.PIPE,check=check).stdout
adb('shell','input','keyevent','KEYCODE_WAKEUP')
adb('shell','wm','dismiss-keyguard')
adb('shell','am','force-stop',a.package)
adb('logcat','-c'); adb('logcat','-b','crash','-c')
(out/'launch.txt').write_bytes(adb('shell','am','start','-W','-n',a.package+'/org.boxdroid.m5.'+activity))
pid=adb('shell','pidof',a.package).decode().strip(); assert pid.isdigit(),pid
(out/'process.txt').write_text('pid='+pid+'\npackage='+a.package+'\n')
(out/'clock-ticks.txt').write_bytes(adb('shell','getconf','CLK_TCK'))
start=time.monotonic(); captures={3,4,6,8,10,12,16,20,30,40}; captured=set()
with (out/'threads.jsonl').open('w') as f:
 while time.monotonic()-start<a.seconds:
  now=time.monotonic()-start
  command=f'for t in /proc/{pid}/task/*; do cat "$t/stat"; cat "$t/schedstat"; cat "$t/wchan"; echo; done'
  raw=adb('shell','run-as',a.package,'sh','-c',"'"+command+"'",check=False).decode()
  f.write(json.dumps({'seconds':now,'data':raw})+'\n');f.flush()
  for sec in sorted(captures-captured):
   if now>=sec:
    (out/f'screen-{sec}s.png').write_bytes(adb('exec-out','screencap','-p'));captured.add(sec)
  time.sleep(max(0,1-(time.monotonic()-start-now)))
(out/'screen.png').write_bytes(adb('exec-out','screencap','-p'))
adb('shell','input','keyevent','KEYCODE_BACK');time.sleep(10)
(out/'logcat.txt').write_bytes(adb('logcat','-d','-v','threadtime','-s','BoxDroidM53:I','BoxDroidM52:I','BoxDroidM5:I','BoxDroidM4:I','*:S'))
(out/'crash-buffer.txt').write_bytes(adb('logcat','-b','crash','-d'))
adb('shell','am','force-stop',a.package)
print(out.resolve(),pid)

if a.package == 'org.boxdroid.m53':
 subprocess.run([sys.executable,str(pathlib.Path(__file__).with_name('m5.3-analyze.py')),str(out)],check=True)
