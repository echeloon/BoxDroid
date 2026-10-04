#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export BOXDROID_M5_PACKAGE=org.boxdroid.m53
export BOXDROID_M5_ACTIVITY=org.boxdroid.m53/org.boxdroid.m5.PerformanceActivity
export BOXDROID_M5_ANDROID_PROJECT="$ROOT/android/m53"
export BOXDROID_M5_WORK_ROOT="${BOXDROID_M53_WORK_ROOT:-$ROOT/build/m5.3/repro}"
export BOXDROID_M5_RESULTS="${BOXDROID_M53_RESULTS:-$BOXDROID_M5_WORK_ROOT/results}"
export BOXDROID_M5_APK="$ROOT/build/m5.3/BoxDroid-M5.3-arm64-v8a.apk"
export BOXDROID_M5_COMPANION_PACKAGE_TO_STOP=org.boxdroid.m5
export BOXDROID_M5_STOP_WAIT_SECS=10

grep -qx '0015-m53-performance-timing.patch' "$ROOT/patches/xemu/series"
export BOXDROID_M5_PREPARE_ONLY=1
export BOXDROID_M5_EXTRA_CFLAGS="-DBOXDROID_M53_RUNTIME=1"
"$ROOT/scripts/m5-xbox-boot-android.sh" "$@"
if [[ "${BOXDROID_M53_PREPARE_ONLY:-0}" != 1 ]]; then
    python3 "$ROOT/scripts/m5.3-benchmark.py" --results "$BOXDROID_M5_RESULTS" \
        --seconds "${BOXDROID_M5_OBSERVE_SECS:-45}"
fi
