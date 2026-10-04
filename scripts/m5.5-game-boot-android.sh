#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_ONLY=0
ARGS=()
for arg in "$@"; do
    if [[ "$arg" == "--build-only" ]]; then BUILD_ONLY=1; else ARGS+=("$arg"); fi
done

export BOXDROID_M5_PACKAGE=org.boxdroid.m55
export BOXDROID_M5_ACTIVITY=org.boxdroid.m55/org.boxdroid.m55.M55Activity
export BOXDROID_M5_ANDROID_PROJECT="$ROOT/android/m55"
export BOXDROID_M5_WORK_ROOT="${BOXDROID_M55_WORK_ROOT:-$ROOT/build/m5.5/repro}"
export BOXDROID_M5_RESULTS="${BOXDROID_M55_RESULTS:-$ROOT/build/m5.5/results}"
export BOXDROID_M5_APK="$ROOT/build/m5.5/BoxDroid-M5.5-arm64-v8a.apk"
export BOXDROID_M5_PREPARE_ONLY=1
export BOXDROID_M5_STOP_WAIT_SECS=10
export BOXDROID_M5_EXTRA_CFLAGS="-DBOXDROID_M53_RUNTIME=1 -DBOXDROID_M54_RUNTIME=1 -DBOXDROID_M55_RUNTIME=1"
export BOXDROID_M6_AUDIO=0
export BOXDROID_M2_M6_AUDIO=0
export BOXDROID_M2_OPTIMIZED_BUILD=1

"$ROOT/scripts/m5-xbox-boot-android.sh" "${ARGS[@]}"

if [[ "$BUILD_ONLY" == 1 ]]; then
    echo "M55_BUILD=READY package=org.boxdroid.m55 apk=$BOXDROID_M5_APK"
    exit 0
fi

ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"
ADB="$ANDROID_HOME/platform-tools/adb"
[[ -x "$ADB" ]] || ADB=adb
if [[ -n "${ANDROID_SERIAL:-}" ]]; then
    ADB=("$ADB" -s "$ANDROID_SERIAL")
else
    count="$("$ADB" devices | awk 'NR > 1 && $2 == "device" {n++} END {print n+0}')"
    [[ "$count" == 1 ]] || { echo "error: set ANDROID_SERIAL or connect exactly one authorized device" >&2; exit 1; }
    serial="$("$ADB" devices | awk 'NR > 1 && $2 == "device" {print $1; exit}')"
    ADB=("$ADB" -s "$serial")
fi

"${ADB[@]}" get-state | grep -qx device
"${ADB[@]}" shell am force-stop org.boxdroid.m55
"${ADB[@]}" logcat -c
"${ADB[@]}" shell am start -W -n org.boxdroid.m55/.M55Activity \
    | tee "$BOXDROID_M5_RESULTS/m55-launch.txt"
sleep 2
"${ADB[@]}" exec-out screencap -p > "$BOXDROID_M5_RESULTS/m55-picker-screen.png"
"${ADB[@]}" logcat -d -s BoxDroidM55:I BoxDroidM5:I '*:S' \
    > "$BOXDROID_M5_RESULTS/m55-preselection-logcat.txt"
grep -q 'M55_STATE_IDLE emulator=stopped' "$BOXDROID_M5_RESULTS/m55-preselection-logcat.txt"
grep -q 'M55_PICKER_LAUNCHED action=ACTION_OPEN_DOCUMENT' "$BOXDROID_M5_RESULTS/m55-preselection-logcat.txt"
if grep -Eq 'M55_EMULATOR_START_REQUEST|M55_MCPX_BIOS_START|XBOX_INIT_BEGIN|XBOX_MAIN_LOOP_START' \
    "$BOXDROID_M5_RESULTS/m55-preselection-logcat.txt"; then
    echo "error: emulator startup occurred before game selection" >&2
    exit 1
fi
echo "M55_PICKER=VISIBLE emulator=STOPPED; select an Xbox image manually on the device"
