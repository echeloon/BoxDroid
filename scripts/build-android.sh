#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
die() { echo "error: $*" >&2; exit 1; }

case "$(uname -s)" in
    Darwin) HOST_TAG=darwin-x86_64; DEFAULT_ANDROID_HOME="$HOME/Library/Android/sdk" ;;
    Linux) HOST_TAG=linux-x86_64; DEFAULT_ANDROID_HOME="$HOME/Android/Sdk" ;;
    *) die "unsupported host OS: $(uname -s) (supported: macOS, Linux)" ;;
esac

# Prefer an explicit JDK; otherwise let Gradle use the java found on PATH.
if [[ -n "${JAVA_HOME:-}" ]]; then
    [[ -x "$JAVA_HOME/bin/java" ]] || die "JAVA_HOME=$JAVA_HOME does not contain bin/java"
    export PATH="$JAVA_HOME/bin:$PATH"
elif ! command -v java >/dev/null || ! java -version >/dev/null 2>&1; then
    die "no Java runtime found: install JDK 17 and set JAVA_HOME or put java on PATH"
fi
export ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$DEFAULT_ANDROID_HOME}}"
[[ -d "$ANDROID_HOME" ]] || die "Android SDK not found at $ANDROID_HOME: set ANDROID_HOME"
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

# Build the pinned app-local loader and its namespace hooks, never a GPU driver.
cmake -S "$ROOT/native/android/driver" -B "$BUILD_ROOT/driver" \
    -DCMAKE_TOOLCHAIN_FILE="$ANDROID_NDK_HOME/build/cmake/android.toolchain.cmake" \
    -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-28 -DCMAKE_BUILD_TYPE=Release
cmake --build "$BUILD_ROOT/driver" -j"${JOBS:-4}"
mkdir -p "$BUILD_ROOT/jniLibs/arm64-v8a"
find "$BUILD_ROOT/driver" -name '*.so' -exec cp {} "$BUILD_ROOT/jniLibs/arm64-v8a/" \;

# Reconstruct and incrementally build every time, including when a .so exists.
# Otherwise native source changes silently leave stale code inside the APK.
./scripts/build-native.sh
ninja -C "$BUILD_ROOT" -j"${JOBS:-4}" libboxdroid.so
mkdir -p "$BUILD_ROOT/jniLibs/arm64-v8a" "$BUILD_ROOT/assets"
cp "$BUILD_ROOT/libboxdroid.so" "$BUILD_ROOT/jniLibs/arm64-v8a/"
cp "$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG/sysroot/usr/lib/aarch64-linux-android/libc++_shared.so" "$BUILD_ROOT/jniLibs/arm64-v8a/"

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
# Replace, not merge: content-hashed bundles from older builds would otherwise
# accumulate and be packaged into the APK.
shutil.rmtree(destination, ignore_errors=True)
shutil.copytree(root / 'web-frontend/build/client', destination)
PYASSETS
(cd android && ./gradlew assembleDebug -PnativeBuildRoot="$BUILD_ROOT")
APK_PATH="$ROOT/android/app/build/outputs/apk/debug/app-debug.apk"
[[ -s "$APK_PATH" ]] || { echo "APK not found: $APK_PATH" >&2; exit 1; }
echo "Built $APK_PATH"

if [[ "${BOXDROID_INSTALL:-1}" == 1 ]]; then
    adb=( adb )
    if [[ -n "${ANDROID_SERIAL:-}" ]]; then
        adb+=( -s "$ANDROID_SERIAL" )
    fi
    "${adb[@]}" install -r "$APK_PATH"
    "${adb[@]}" shell am start -n org.boxdroid/.FrontendActivity
fi
