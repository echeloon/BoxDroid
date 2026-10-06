#!/usr/bin/env bash
set -e

# Ensure JDK 17 is used
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
export PATH="$JAVA_HOME/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/30.0.16248370"
export ANDROID_NDK_ROOT="$ANDROID_NDK_HOME"

BUILD_ROOT="$(pwd)/build/native/android-arm64"

export BOXDROID_WORK_ROOT="$(pwd)/build/native"
export BOXDROID_TARGET_LIST=i386-softmmu
export BOXDROID_EXTRA_CFLAGS="-DBOXDROID_RUNTIME=1 -DBOXDROID_RUNTIME=1 -DBOXDROID_RUNTIME=1 -DBOXDROID_AUDIO=1"
export BOXDROID_ENABLE_SDL=0
export BOXDROID_STATIC_PIC=1
export BOXDROID_RUNTIME=0
export BOXDROID_PRESENTER=0
export BOXDROID_XBOX_RUNTIME=1
export BOXDROID_AUDIO=1
export BOXDROID_INPUT=1
export BOXDROID_OPTIMIZED_BUILD=1

if [ ! -f "$BUILD_ROOT/libboxdroid.so" ]; then
    echo "Building native code from scratch..."
    ./scripts/build-native.sh
    ninja -C "$BUILD_ROOT" -j4 libboxdroid.so
    
    echo "Packaging JNI libs..."
    mkdir -p "$BUILD_ROOT/jniLibs/arm64-v8a"
    cp "$BUILD_ROOT/libboxdroid.so" "$BUILD_ROOT/jniLibs/arm64-v8a/"
    cp "$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/aarch64-linux-android/libc++_shared.so" "$BUILD_ROOT/jniLibs/arm64-v8a/"
    
    # We also need the assets from somewhere. Where did they come from?
    # Usually they are inside BUILD_ROOT/assets, but they come from upstream/xemu/ui or something.
    # The previous gradle script used: assets.srcDirs = ["${nativeBuildRoot}/assets"]
    # We must create this folder and populate it if needed, 
    mkdir -p "$BUILD_ROOT/assets"
fi

echo "Building BoxDroid APK..."
cd android
./gradlew assembleDebug -PnativeBuildRoot="$BUILD_ROOT"

APK_PATH="app/build/outputs/apk/debug/app-debug.apk"

if [ -f "$APK_PATH" ]; then
    echo "Installing BoxDroid APK..."
    adb install -r "$APK_PATH" || true
    
    echo "Starting BoxDroid..."
    adb shell am start -n org.boxdroid/.FrontendActivity
    
    echo "Streaming Logcat... (Press Ctrl+C to stop)"
    adb logcat -c || true
    adb logcat | grep -i "boxdroid" &
    LOG_PID=$!
    # Let it run for a bit, then kill so the task completes.
    sleep 10
    kill $LOG_PID || true
else
    echo "APK not found!"
    exit 1
fi
