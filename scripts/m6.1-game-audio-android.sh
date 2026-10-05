#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BUILD_ONLY=0
ARGS=()
for arg in "$@"; do
    if [[ "$arg" == "--build-only" ]]; then BUILD_ONLY=1; else ARGS+=("$arg"); fi
done

export BOXDROID_M5_PACKAGE=org.boxdroid.m61
export BOXDROID_M5_ACTIVITY=org.boxdroid.m61/org.boxdroid.m61.M61Activity
export BOXDROID_M5_ANDROID_PROJECT="$ROOT/android/m61"
export BOXDROID_M5_WORK_ROOT="${BOXDROID_M61_WORK_ROOT:-$ROOT/build/m6.1/repro}"
export BOXDROID_M5_RESULTS="${BOXDROID_M61_RESULTS:-$ROOT/build/m6.1/results}"
export BOXDROID_M5_APK="$ROOT/build/m6.1/BoxDroid-M6.1-arm64-v8a.apk"
export BOXDROID_M5_PREPARE_ONLY=1
export BOXDROID_M6_PREPARE_ONLY=1
export BOXDROID_M5_STOP_WAIT_SECS=10
export BOXDROID_M5_EXTRA_CFLAGS="-DBOXDROID_M53_RUNTIME=1 -DBOXDROID_M54_RUNTIME=1 -DBOXDROID_M55_RUNTIME=1"
export BOXDROID_M6_AUDIO=1
export BOXDROID_M2_M6_AUDIO=1
export BOXDROID_M2_OPTIMIZED_BUILD=1

grep -qx '0018-m6-audio-android.patch' "$ROOT/patches/xemu/series"
"$ROOT/scripts/m5-xbox-boot-android.sh" "${ARGS[@]}"

if [[ "$BUILD_ONLY" == 1 ]]; then
    echo "M61_BUILD=READY package=org.boxdroid.m61 apk=$BOXDROID_M5_APK"
    exit 0
fi

if [[ -n "${ANDROID_SERIAL:-}" ]]; then ADB=(adb -s "$ANDROID_SERIAL")
else
    count="$(adb devices | awk 'NR > 1 && $2 == "device" {n++} END {print n+0}')"
    [[ "$count" == 1 ]] || { echo "error: set ANDROID_SERIAL or connect exactly one authorized device" >&2; exit 1; }
    serial="$(adb devices | awk 'NR > 1 && $2 == "device" {print $1; exit}')"
    ADB=(adb -s "$serial")
fi

RESULTS="$BOXDROID_M5_RESULTS"
"${ADB[@]}" get-state | grep -qx device
"${ADB[@]}" shell am force-stop org.boxdroid.m61
"${ADB[@]}" logcat -c
"${ADB[@]}" shell am start -W -n org.boxdroid.m61/.M61Activity \
    | tee "$RESULTS/launch-preselection.txt"
# Capture the stopped/preselection markers promptly. Leave the picker visible
# for the user; do not wait in this script while they browse/select a document.
sleep 1
pid="$("${ADB[@]}" shell pidof org.boxdroid.m61 | tr -d '\r')"
[[ "$pid" =~ ^[0-9]+$ ]] || { echo "error: M6.1 process did not start" >&2; exit 1; }
echo "pid=$pid" > "$RESULTS/preselection-process.txt"
"${ADB[@]}" exec-out screencap -p > "$RESULTS/preselection-picker.png"
"${ADB[@]}" logcat -d -s BoxDroidM61:I BoxDroidM6:I BoxDroidM6Audio:I BoxDroidM5:I '*:S' \
    > "$RESULTS/preselection-logcat.txt"
grep -q 'M61_STATE_IDLE emulator=stopped' "$RESULTS/preselection-logcat.txt"
grep -q 'M61_PICKER_LAUNCHED action=ACTION_OPEN_DOCUMENT' "$RESULTS/preselection-logcat.txt"
python3 - "$RESULTS/preselection-logcat.txt" <<'PY'
from pathlib import Path
import sys

lines = Path(sys.argv[1]).read_text(errors="replace").splitlines()

def at(marker):
    return next((i for i, line in enumerate(lines) if marker in line), None)

validation = at("M61_URI_VALIDATED")
attach_request = at("M61_DVD_ATTACH_REQUEST")
fd_validated = at("M55_URI_FD_VALIDATED")
drive_attached = at("M55_DVD_ATTACHED")
boot_attempt = at("M55_GAME_BOOT_ATTEMPT")
main_loop = at("XBOX_MAIN_LOOP_START")
start_markers = (
    "XBOX_INIT_BEGIN", "XBOX_MAIN_LOOP_START", "APU_MONITOR_ATTACHED",
    "M55_GAME_BOOT_ATTEMPT", "M55_MCPX_BIOS_START",
)
starts = [(i, marker) for i, line in enumerate(lines)
          for marker in start_markers if marker in line]

if validation is None:
    if starts or attach_request is not None or fd_validated is not None:
        raise SystemExit("error: guest startup occurred without a validated picker URI")
    print("M61_PICKER=VISIBLE emulator=STOPPED audio_stream=NOT_INITIALIZED")
else:
    if attach_request is None or attach_request < validation:
        raise SystemExit("error: selected URI was not validated before DVD attach request")
    if any(i < validation for i, _ in starts):
        raise SystemExit("error: guest/APU startup preceded selected URI validation")
    if fd_validated is None or drive_attached is None or boot_attempt is None or main_loop is None:
        raise SystemExit("error: selected DVD boot ordering is incomplete in captured log")
    if not (fd_validated < drive_attached < boot_attempt < main_loop):
        raise SystemExit("error: DVD attach did not precede guest main-loop start")
    print("M61_STARTUP_ORDER=VALID selected_uri=validated dvd=attached_before_guest_loop")
PY
echo "M61_PICKER_FLOW=READY; any XISO selection must be made manually in the Android picker"
