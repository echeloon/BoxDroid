import hashlib,json,os,shutil,subprocess,sys,zipfile
from pathlib import Path
root=Path.cwd(); build=root/'build/native/android-arm64'
with (root/'build/native-perf-run'/(sys.argv[1]+'-package-native-build.log')).open('w') as f:
    subprocess.run(['ninja','-C',str(build),'-j4','libboxdroid.so'],stdout=f,stderr=subprocess.STDOUT,check=True)
out=root/'build/native-perf-run'/sys.argv[1];out.mkdir(exist_ok=False)
shutil.copy2(build/'libboxdroid.so',out/'libboxdroid.so')
pack=out/'packaging'
shutil.copytree(build/'jniLibs',pack/'jniLibs')
shutil.copytree(build/'assets',pack/'assets')
shutil.copy2(out/'libboxdroid.so',pack/'jniLibs/arm64-v8a/libboxdroid.so')
env=dict(os.environ,JAVA_HOME='/opt/homebrew/opt/openjdk@17',ANDROID_HOME='/Users/maverick/Library/Android/sdk',ANDROID_SDK_ROOT='/Users/maverick/Library/Android/sdk')
with (out/'gradle.log').open('w') as f:
    subprocess.run(['./gradlew','assembleDebug','-PnativeBuildRoot='+str(pack)],cwd=root/'android',env=env,stdout=f,stderr=subprocess.STDOUT,check=True)
shutil.copy2(root/'android/app/build/outputs/apk/debug/app-debug.apk',out/'app.apk')
with zipfile.ZipFile(out/'app.apk') as z:
    (out/'apk-lib.so').write_bytes(z.read('lib/arm64-v8a/libboxdroid.so'))
obj='/Users/maverick/Library/Android/sdk/ndk/30.0.16248370/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-objcopy'
hashes={}
for name in ['libboxdroid.so','apk-lib.so']:
    text=out/(name+'.text')
    subprocess.run([obj,'--dump-section','.text='+str(text),str(out/name)],check=True)
    hashes[name]=hashlib.sha256(text.read_bytes()).hexdigest()
assert len(set(hashes.values()))==1
for section in ['.rodata','.data.rel.ro','.data']:
    values=[]
    for name in ['libboxdroid.so','apk-lib.so']:
        target=out/(name+section+'.verify')
        subprocess.run([obj,'--dump-section',section+'='+str(target),str(out/name)],check=True)
        values.append(hashlib.sha256(target.read_bytes()).hexdigest())
    assert values[0]==values[1],(section,values)
    hashes[section]=values[0]
hashes['apk']=hashlib.sha256((out/'app.apk').read_bytes()).hexdigest()
hashes['head']=subprocess.check_output(['git','rev-parse','HEAD'],text=True).strip()
(out/'source.diff').write_bytes(subprocess.check_output(['git','-C',str(root/'build/native/source/xemu'),'diff']))
shutil.copy2(root/'build/native/source/xemu/system/boxdroid-xbox-runtime.c',out/'runtime-source.c')
hashes['runtime_source']=hashlib.sha256((out/'runtime-source.c').read_bytes()).hexdigest()
hashes['source_diff']=hashlib.sha256((out/'source.diff').read_bytes()).hexdigest()
(out/'provenance.json').write_text(json.dumps(hashes,indent=2))
print(json.dumps(hashes,indent=2))
