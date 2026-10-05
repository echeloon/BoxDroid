#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export BOXDROID_M5_PACKAGE=org.boxdroid.m6
export BOXDROID_M5_ACTIVITY=org.boxdroid.m6/org.boxdroid.m6.M6Activity
export BOXDROID_M5_ANDROID_PROJECT="$ROOT/android/m6"
export BOXDROID_M5_WORK_ROOT="${BOXDROID_M6_WORK_ROOT:-$ROOT/build/m6/repro}"
export BOXDROID_M5_RESULTS="${BOXDROID_M6_RESULTS:-$ROOT/build/m6/results}"
export BOXDROID_M5_APK="$ROOT/build/m6/BoxDroid-M6-arm64-v8a.apk"
export BOXDROID_M5_PREPARE_ONLY=1
export BOXDROID_M5_STOP_WAIT_SECS=10
export BOXDROID_M6_AUDIO=1
export BOXDROID_M2_M6_AUDIO=1
export BOXDROID_M2_OPTIMIZED_BUILD=1
export BOXDROID_M5_EXTRA_CFLAGS="-DBOXDROID_M53_RUNTIME=1 -DBOXDROID_M54_RUNTIME=1 -DBOXDROID_M6_AUDIO=1"

grep -qx '0018-m6-audio-android.patch' "$ROOT/patches/xemu/series"
"$ROOT/scripts/m5-xbox-boot-android.sh" "$@"

if [[ "${BOXDROID_M6_PREPARE_ONLY:-0}" != 1 ]]; then
    python3 "$ROOT/scripts/m6-audio-benchmark.py" \
        --package org.boxdroid.m6 \
        --activity org.boxdroid.m6.M6Activity \
        --results "$BOXDROID_M5_RESULTS" \
        --seconds "${BOXDROID_M6_OBSERVE_SECS:-28}"
fi
