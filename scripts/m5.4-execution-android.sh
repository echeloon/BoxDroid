#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export BOXDROID_M5_PACKAGE=org.boxdroid.m54
export BOXDROID_M5_ACTIVITY=org.boxdroid.m54/org.boxdroid.m5.PerformanceActivity
export BOXDROID_M5_ANDROID_PROJECT="$ROOT/android/m54"
export BOXDROID_M5_WORK_ROOT="${BOXDROID_M54_WORK_ROOT:-$ROOT/build/m5.4/repro}"
export BOXDROID_M5_RESULTS="${BOXDROID_M54_RESULTS:-$BOXDROID_M5_WORK_ROOT/results}"
export BOXDROID_M5_APK="$ROOT/build/m5.4/BoxDroid-M5.4-arm64-v8a.apk"
export BOXDROID_M5_COMPANION_PACKAGE_TO_STOP=org.boxdroid.m5
export BOXDROID_M5_STOP_WAIT_SECS=10

grep -qx '0016-m54-execution-profile.patch' "$ROOT/patches/xemu/series"
export BOXDROID_M2_OPTIMIZED_BUILD="${BOXDROID_M54_RELEASE:-1}"
export BOXDROID_M5_PREPARE_ONLY=1
export BOXDROID_M5_EXTRA_CFLAGS="-DBOXDROID_M53_RUNTIME=1 -DBOXDROID_M54_RUNTIME=1"
if [[ "${BOXDROID_M54_X87_PROFILE:-0}" == 1 ]]; then
    export BOXDROID_M5_EXTRA_CFLAGS="$BOXDROID_M5_EXTRA_CFLAGS -DBOXDROID_M54_X87_PROFILE=1"
fi
"$ROOT/scripts/m5-xbox-boot-android.sh" "$@"
if [[ "${BOXDROID_M54_PREPARE_ONLY:-0}" != 1 ]]; then
    python3 "$ROOT/scripts/m5.4-benchmark.py" --results "$BOXDROID_M5_RESULTS" \
        --seconds "${BOXDROID_M5_OBSERVE_SECS:-45}"
fi
