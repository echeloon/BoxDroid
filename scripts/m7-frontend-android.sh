#!/usr/bin/env bash
set -e

# Build the native components using the reproducible script
# ./scripts/m5-repro-android-arm64.sh

BUILD_ROOT="$(pwd)/build/m7/repro/core/android-arm64"

# Ensure JDK 17 is used
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
export PATH="$JAVA_HOME/bin:$PATH"
export ANDROID_HOME="$HOME/Library/Android/sdk"

echo "Building M7 APK..."
cd android/m7
../m5/gradlew assembleDebug -Pm5BuildRoot="$BUILD_ROOT"

APK_PATH="app/build/outputs/apk/debug/app-debug.apk"

if [ -f "$APK_PATH" ]; then
    echo "Installing M7 APK..."
    adb install -r "$APK_PATH"
    
    echo "Starting M7 Activity..."
    adb shell am start -n org.boxdroid.m7/.FrontendActivity
    
    echo "Streaming Logcat..."
    adb logcat -c
    adb logcat | grep -i "m7\|boxdroid"
else
    echo "APK not found!"
    exit 1
fi
