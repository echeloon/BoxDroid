#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIN=478b4f496102379c7eaa7f3ec10e714a703c4300
BUILD_ONLY=0
ARGS=()
for arg in "$@"; do
    if [[ "$arg" == "--build-only" ]]; then BUILD_ONLY=1; else ARGS+=("$arg"); fi
done

WORK_ROOT="${BOXDROID_M62_WORK_ROOT:-$ROOT/build/m6.2/repro}"
CORE_ROOT="$WORK_ROOT/core"
BUILD="$CORE_ROOT/android-arm64"
RESULTS="${BOXDROID_M62_RESULTS:-$ROOT/build/m6.2/results}"
ANDROID_PROJECT="$ROOT/android/m62"
APK="$ROOT/build/m6.2/BoxDroid-M6.2-arm64-v8a.apk"
PACKAGE=org.boxdroid.m62
ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"
ANDROID_NDK_HOME="${ANDROID_NDK_HOME:-$ANDROID_HOME/ndk/30.0.16248370}"
export ANDROID_HOME ANDROID_SDK_ROOT="$ANDROID_HOME" ANDROID_NDK_HOME

die() { echo "error: $*" >&2; exit 1; }

[[ "$(git -C "$ROOT" branch --show-current)" == android-port ]] || die "must run on android-port"
[[ "$(git -C "$ROOT/upstream/xemu" rev-parse HEAD)" == "$PIN" ]] || die "upstream/xemu pin changed"
grep -qx '0018-m6-audio-android.patch' "$ROOT/patches/xemu/series" || die "M6 audio patch is missing"
grep -qx '0019-m62-android-controller-input.patch' "$ROOT/patches/xemu/series" || die "M6.2 input patch is missing"
python3 - "$ROOT/patches/xemu/series" <<'PY'
from pathlib import Path
import sys
series = Path(sys.argv[1]).read_text().splitlines()
if series.count('0018-m6-audio-android.patch') != 1 or series.count('0019-m62-android-controller-input.patch') != 1:
    raise SystemExit('error: M6.2 patch entries must be unique')
if series.index('0019-m62-android-controller-input.patch') != series.index('0018-m6-audio-android.patch') + 1:
    raise SystemExit('error: M6.2 patch must immediately follow M6 audio patch')
PY

export BOXDROID_M5_PACKAGE="$PACKAGE"
export BOXDROID_M5_ACTIVITY="$PACKAGE/.M62Activity"
export BOXDROID_M5_ANDROID_PROJECT="$ANDROID_PROJECT"
export BOXDROID_M5_WORK_ROOT="$WORK_ROOT"
export BOXDROID_M5_RESULTS="$RESULTS"
export BOXDROID_M5_PREPARE_ONLY=1
export BOXDROID_M6_PREPARE_ONLY=1
export BOXDROID_M5_STOP_WAIT_SECS=10
export BOXDROID_M5_COMPANION_PACKAGE_TO_STOP=org.boxdroid.m61
export BOXDROID_M5_EXTRA_CFLAGS="-DBOXDROID_M53_RUNTIME=1 -DBOXDROID_M54_RUNTIME=1 -DBOXDROID_M55_RUNTIME=1"
export BOXDROID_M6_AUDIO=1
export BOXDROID_M2_M6_AUDIO=1
export BOXDROID_M2_M62_INPUT=1
export BOXDROID_M2_OPTIMIZED_BUILD=1

mkdir -p "$RESULTS"
if [[ -n "${ARGS[*]-}" ]]; then
    "$ROOT/scripts/m5-xbox-boot-android.sh" "${ARGS[@]}"
else
    "$ROOT/scripts/m5-xbox-boot-android.sh"
fi

APKSIGNER="$ANDROID_HOME/build-tools/36.0.0/apksigner"
AAPT="$ANDROID_HOME/build-tools/36.0.0/aapt"
[[ -x "$APKSIGNER" ]] || die "missing apksigner from Android build-tools 36.0.0"
[[ -x "$AAPT" ]] || die "missing aapt from Android build-tools 36.0.0"

"$ROOT/android/m5/gradlew" --no-daemon -p "$ANDROID_PROJECT" \
    -Pm5BuildRoot="$BUILD" assembleDebug | tee "$RESULTS/gradle.log"
APK_BUILD="$ANDROID_PROJECT/app/build/outputs/apk/debug/app-debug.apk"
mkdir -p "$(dirname "$APK")"
cp "$APK_BUILD" "$APK"
"$APKSIGNER" verify --verbose "$APK" > "$RESULTS/apk-signature.txt"
"$AAPT" dump badging "$APK" > "$RESULTS/apk-badging.txt"
grep -q "package: name='$PACKAGE'" "$RESULTS/apk-badging.txt" || die "APK package identity mismatch"
grep -q "application-label:'BoxDroid M6.2'" "$RESULTS/apk-badging.txt" || die "APK app label mismatch"
unzip -l "$APK" > "$RESULTS/apk-contents.txt"
grep -q 'lib/arm64-v8a/libboxdroid.so' "$RESULTS/apk-contents.txt" || die "arm64 native runtime is missing"
"${ANDROID_NDK_HOME:-$ANDROID_HOME/ndk/30.0.16248370}/toolchains/llvm/prebuilt/darwin-x86_64/bin/llvm-readelf" \
    -h -Ws "$BUILD/libboxdroid.so" > "$RESULTS/libboxdroid-readelf.txt"
grep -q 'Machine:.*AArch64' "$RESULTS/libboxdroid-readelf.txt" || die "native runtime is not AArch64"
grep -q 'Java_org_boxdroid_m62_M62Input_nativeSetState' "$RESULTS/libboxdroid-readelf.txt" || die "M6.2 input JNI symbol is missing"
grep -q 'Java_org_boxdroid_m62_M62Input_nativeSelectPrimary' "$RESULTS/libboxdroid-readelf.txt" || die "M6.2 primary selection JNI symbol is missing"
grep -q 'Java_org_boxdroid_m62_M62Input_nativeClearAll' "$RESULTS/libboxdroid-readelf.txt" || die "M6.2 lifecycle JNI symbol is missing"

echo "M62_BUILD=READY package=$PACKAGE apk=$APK"
if [[ "$BUILD_ONLY" == 1 ]]; then
    exit 0
fi

if [[ -n "${ANDROID_SERIAL:-}" ]]; then ADB=(adb -s "$ANDROID_SERIAL")
else
    count="$(adb devices | awk 'NR > 1 && $2 == "device" {n++} END {print n+0}')"
    [[ "$count" == 1 ]] || die "set ANDROID_SERIAL or connect exactly one authorized device"
    serial="$(adb devices | awk 'NR > 1 && $2 == "device" {print $1; exit}')"
    ADB=(adb -s "$serial")
fi
"${ADB[@]}" get-state | grep -qx device
"${ADB[@]}" shell am force-stop "$PACKAGE"
"${ADB[@]}" install -r "$APK" | tee "$RESULTS/install.txt"
"${ADB[@]}" logcat -c
"${ADB[@]}" shell am start -W -n "$PACKAGE/.M62Activity" | tee "$RESULTS/launch-preselection.txt"
sleep 1
pid="$("${ADB[@]}" shell pidof "$PACKAGE" | tr -d '\r')"
[[ "$pid" =~ ^[0-9]+$ ]] || die "M6.2 process did not start"
echo "pid=$pid" > "$RESULTS/preselection-process.txt"
"${ADB[@]}" exec-out screencap -p > "$RESULTS/preselection-picker.png"
"${ADB[@]}" logcat -d -s BoxDroidM61:I BoxDroidM62:I BoxDroidM62Input:I BoxDroidM6:I BoxDroidM6Audio:I BoxDroidM5:I '*:S' \
    > "$RESULTS/preselection-logcat.txt"
grep -q 'M61_STATE_IDLE emulator=stopped' "$RESULTS/preselection-logcat.txt" || die "preselection idle state was not observed"
grep -q 'M61_PICKER_LAUNCHED action=ACTION_OPEN_DOCUMENT' "$RESULTS/preselection-logcat.txt" || die "Android picker was not launched"
if grep -Eq 'XBOX_INIT_BEGIN|XBOX_MAIN_LOOP_START|M55_GAME_BOOT_ATTEMPT|M55_MCPX_BIOS_START|APU_MONITOR_ATTACHED' "$RESULTS/preselection-logcat.txt"; then
    die "emulator/APU started before XISO selection"
fi
echo "M62_PICKER=VISIBLE package=$PACKAGE pid=$pid emulator=STOPPED; select the XISO manually in Android DocumentsUI"
