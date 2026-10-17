#!/usr/bin/env python3
"""RP5 correction validation: physical input, saved screenshots, verified scene.

Requires ADB and the existing System graphics-driver configuration. This does
not install an APK or alter driver/rendering/audio/worker settings. Controls
are supplied by the caller before launch. OCR uses macOS Vision, no package
installation. A menu/loading/title capture is never accepted as gameplay.
"""
import argparse,json,re,subprocess,time
from pathlib import Path

ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'build/production-correction'
OCR=OUT/'ocr'

def adb(*args,**kwargs):
    return subprocess.run(['adb',*args],check=True,**kwargs)

def shell(command):
    return adb('shell',command,stdout=subprocess.DEVNULL)

def event(kind,code,value):
    shell(f'sendevent /dev/input/event8 {kind} {code} {value}; sendevent /dev/input/event8 0 0 0')

def button(code,hold=0.5):
    event(1,code,1)
    try: time.sleep(hold)
    finally: event(1,code,0)

def neutral():
    for axis in [0,1,2,5,9,10,16,17]:event(3,axis,0)
    for key in [304,305,307,308,315]:event(1,key,0)

def screenshot(path):
    with path.open('wb') as f:adb('exec-out','screencap','-p',stdout=f)

def recognize(path):
    return subprocess.check_output([str(OCR),str(path)],text=True)

def launch(title,label,checkpoint_row=None):
    if not OCR.exists():
        subprocess.run(['swiftc',str(ROOT/'scripts/tests/read-screen.swift'),'-o',str(OCR)],check=True)
    driver=subprocess.check_output(['adb','shell','run-as','org.boxdroid','cat','files/graphics-drivers/state.json'],text=True)
    assert 'SYSTEM' in driver, 'System graphics driver required'
    nav=OUT/'navigation'/label;nav.mkdir(parents=True,exist_ok=False)
    neutral();shell('am force-stop org.boxdroid')
    shell('am start -n org.boxdroid/.FrontendActivity');time.sleep(3)
    shell('input tap 960 460');time.sleep(2)
    shell('input tap 400 '+('360' if title=='pandora' else '580'))
    started=time.monotonic();last_action=0;quick=False;seen_title=False
    checkpoint_selected=False
    for n in range(150):
        time.sleep(2)
        path=nav/f'{n:03d}.png';screenshot(path)
        text=recognize(path);(nav/f'{n:03d}.txt').write_text(text)
        upper=text.upper();compact=' '.join(upper.split());elapsed=time.monotonic()-started
        print(f'NAV {title} {elapsed:.1f}s '+upper.replace('\n',' | '),flush=True)
        if 'PLAY GAMES' in upper and 'BOXDROID' in upper:
            shell('input tap 960 500');last_action=elapsed;continue
        if 'PANDORA' in upper and 'SEGA' in upper:
            shell('input tap 400 '+('360' if title=='pandora' else '580'))
            last_action=elapsed;continue
        if title=='pandora' and 'PISTOL' in upper and 'MENU' not in upper:
            pid=subprocess.check_output(['adb','shell','pidof','org.boxdroid:emulator'],text=True).strip()
            time.sleep(10);screenshot(nav/'ready.png')
            ready_text=recognize(nav/'ready.png').upper()
            stable_pid=subprocess.check_output(['adb','shell','pidof','org.boxdroid:emulator'],text=True).strip()
            assert pid==stable_pid and 'PISTOL' in ready_text and 'MENU' not in ready_text, 'Scene/process changed during readiness verification'
            return nav
        if title=='sega' and ('LAP' in upper or 'POSITION' in upper) and ('MPH' in upper or 'KM/H' in upper or 'KMH' in upper):
            time.sleep(5);screenshot(nav/'ready.png');return nav
        if elapsed-last_action<2:continue
        if title=='pandora':
            if checkpoint_row is not None and 'CURRENT PROGRESS WILL BE LOST' in upper:
                button(304);last_action=elapsed
                continue
            if checkpoint_row is not None and 'LOAD CHECKPOINT' in upper and 'DILI' in upper:
                if not checkpoint_selected:
                    # Explicit saved-game row; never use the moving autosave.
                    for _ in range(checkpoint_row-1):
                        event(3,17,1);time.sleep(0.15);event(3,17,0);time.sleep(0.2)
                    button(304);last_action=elapsed;checkpoint_selected=True
                continue
            if 'PRESS START' in upper or 'PRESSSTART' in upper:
                button(315);last_action=elapsed;seen_title=True
            elif any(s in upper for s in ['MAIN MENU','SINGLE PLAYER','PROFILES','GAME MENU','LOAD GAME']):
                button(304);last_action=elapsed
            elif 'LOADING' in upper or 'ESRB NOTICE' in upper:
                continue
            elif elapsed>14 and elapsed-last_action>8 and not seen_title:
                button(315);last_action=elapsed
            elif elapsed>20 and elapsed-last_action>12 and seen_title:
                button(315);last_action=elapsed
        else:
            if 'PRESS START' in compact:
                button(315);last_action=elapsed;seen_title=True
            elif 'QUICK BATTLE' in compact and 'CHRONICLE' in compact:
                if not quick:
                    # Fresh NEW GAME highlights SEGA GT 2002. Quick Battle
                    # is the next row; use one D-pad edge, not a held stick.
                    event(3,17,1);time.sleep(0.15);event(3,17,0);quick=True
                button(304);last_action=elapsed
            elif any(s in compact for s in ['NEW GAME','SINGLE RACE','SELECT A','SELECT CAR','SELECT COURSE','SELECT TRACK','CAR SELECT','COURSE SELECT','TRANSMISSION']):
                button(304);last_action=elapsed
            elif not seen_title and elapsed>14 and elapsed-last_action>12:
                # Intro movies and blinking title prompts may have no readable
                # text. START skips them; only a race HUD accepts the scene.
                button(315);last_action=elapsed
        if elapsed>400:break
    raise RuntimeError('Gameplay scene was not established; inspect saved navigation')

def capture(title,label,duration,attach=False,warmup=45,motion='none',perf=False,checkpoint_row=None):
    if attach:
        nav=OUT/'navigation'/label;nav.mkdir(parents=True,exist_ok=False)
        screenshot(nav/'ready.png')
        text=recognize(nav/'ready.png').upper()
        assert title!='pandora' or 'PISTOL' in text, 'Attach requires gameplay'
    else:
        nav=launch(title,label,checkpoint_row)
    with (nav/'startup-runtime.log').open('w') as startup_log:
        adb('logcat','-d','-v','threadtime','-s','BoxDroid:I','*:S',
            stdout=startup_log)
    time.sleep(warmup)
    command=['python3',str(ROOT/'scripts/profile-android.py'),label,'--duration',str(duration),
             '--note',title+' verified gameplay; System driver; motion='+motion,
             '--output',str(OUT/'captures')]
    if perf:command.append('--perf')
    profile=subprocess.Popen(command)
    start=time.monotonic();phase=0;images=[]
    try:
        while time.monotonic()-start<duration:
            if motion=='camera':event(3,2,8000 if phase%2==0 else -8000)
            elif motion=='drive':event(1,304,1 if phase%4<3 else 0)
            if phase%5==0:
                path=nav/f'progress-{phase:03d}.png';begin=time.time();screenshot(path)
                images.append({'file':path.name,'wall_begin':begin,'wall_end':time.time()})
            deadline=start+min(duration,(phase+1)*2)
            time.sleep(max(0,deadline-time.monotonic()));phase+=1
    finally:neutral()
    assert profile.wait()==0,'Profile failed'
    result=json.loads((OUT/'captures'/label/'summary.json').read_text())
    assert result['timing'].get('guest_flips_per_second',0)>0, 'No guest progression: frozen run is invalid'
    assert result['audio'].get('offered_frames',0)>0, 'No produced audio: stopped core is invalid'
    begin=time.time();screenshot(nav/'end.png')
    images.append({'file':'end.png','wall_begin':begin,'wall_end':time.time()})
    (nav/'progression-times.json').write_text(json.dumps(images,indent=2))
    end_text=recognize(nav/'end.png');(nav/'end.txt').write_text(end_text)
    if title=='pandora':assert 'PISTOL' in end_text.upper(), 'End of run is not gameplay'
    else:
        upper=end_text.upper()
        assert 'LAP' in upper and any(x in upper for x in ['MPH','KM/H','KMH']), 'End of run is not a race'
    print('Verified capture complete:',label,flush=True)

if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('title',choices=['pandora','sega'])
    p.add_argument('label');p.add_argument('--duration',type=int,default=30);p.add_argument('--launch-only',action='store_true')
    p.add_argument('--attach',action='store_true');p.add_argument('--warmup',type=int,default=45)
    p.add_argument('--perf',action='store_true',help='Separate diagnostic capture; exclude from final cadence numbers')
    p.add_argument('--motion',choices=['none','camera','drive'],default='none')
    p.add_argument('--checkpoint-row',type=int,choices=[1,2],help='Pandora saved-game row below LOAD CHECKPOINT; avoids changing autosave')
    a=p.parse_args();assert re.fullmatch(r'[\w.-]+',a.label)
    if a.launch_only:launch(a.title,a.label,a.checkpoint_row)
    else:capture(a.title,a.label,a.duration,a.attach,a.warmup,a.motion,a.perf,a.checkpoint_row)
