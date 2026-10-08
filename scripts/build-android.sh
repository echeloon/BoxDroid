#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
export JAVA_HOME="${JAVA_HOME:-/opt/homebrew/opt/openjdk@17}"
export PATH="$JAVA_HOME/bin:$PATH"
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Library/Android/sdk}"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="${ANDROID_NDK_HOME:-$ANDROID_HOME/ndk/30.0.16248370}"
export ANDROID_NDK_ROOT="$ANDROID_NDK_HOME"
export BOXDROID_WORK_ROOT="${BOXDROID_WORK_ROOT:-$ROOT/build/native}"
export BOXDROID_TARGET_LIST=i386-softmmu
export BOXDROID_EXTRA_CFLAGS="${BOXDROID_EXTRA_CFLAGS:--DBOXDROID_RUNTIME=1 -DBOXDROID_AUDIO=1}"
export BOXDROID_ENABLE_SDL=0
export BOXDROID_STATIC_PIC=1
export BOXDROID_RUNTIME=0
export BOXDROID_PRESENTER=0
export BOXDROID_XBOX_RUNTIME=1
export BOXDROID_AUDIO=1
export BOXDROID_INPUT=1
export BOXDROID_OPTIMIZED_BUILD="${BOXDROID_OPTIMIZED_BUILD:-1}"
BUILD_ROOT="$BOXDROID_WORK_ROOT/android-arm64"

# Reconstruct and incrementally build every time, including when a .so exists.
# Otherwise native source changes silently leave stale code inside the APK.
./scripts/build-native.sh
ninja -C "$BUILD_ROOT" -j"${JOBS:-4}" libboxdroid.so
mkdir -p "$BUILD_ROOT/jniLibs/arm64-v8a" "$BUILD_ROOT/assets"
cp "$BUILD_ROOT/libboxdroid.so" "$BUILD_ROOT/jniLibs/arm64-v8a/"
cp "$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/aarch64-linux-android/libc++_shared.so" "$BUILD_ROOT/jniLibs/arm64-v8a/"

if [[ ! -d web-frontend/node_modules ]]; then
    (cd web-frontend && npm ci)
fi
(cd web-frontend && npm run build)
python3 - "$ROOT" <<'PYASSETS'
from pathlib import Path
import shutil
import sys
root = Path(sys.argv[1])
destination = root / 'android/app/src/main/assets/www'
shutil.copytree(root / 'web-frontend/build/client', destination, dirs_exist_ok=True)
PYASSETS
(cd android && ./gradlew assembleDebug -PnativeBuildRoot="$BUILD_ROOT")
APK_PATH="$ROOT/android/app/build/outputs/apk/debug/app-debug.apk"
[[ -s "$APK_PATH" ]] || { echo "APK not found: $APK_PATH" >&2; exit 1; }
echo "Built $APK_PATH"

if [[ "${BOXDROID_INSTALL:-1}" == 1 ]]; then
    adb install -r "$APK_PATH"
    adb shell am start -n org.boxdroid/.FrontendActivity
fi
