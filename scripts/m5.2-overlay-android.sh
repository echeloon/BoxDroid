#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export BOXDROID_M5_PACKAGE=org.boxdroid.m52
export BOXDROID_M5_ACTIVITY=org.boxdroid.m52/org.boxdroid.m5.OverlayActivity
export BOXDROID_M5_ANDROID_PROJECT="$ROOT/android/m52"
export BOXDROID_M5_WORK_ROOT="${BOXDROID_M52_WORK_ROOT:-$ROOT/build/m5.2/repro}"
export BOXDROID_M5_RESULTS="${BOXDROID_M52_RESULTS:-$BOXDROID_M5_WORK_ROOT/results}"
export BOXDROID_M5_APK="$ROOT/build/m5.2/BoxDroid-M5.2-arm64-v8a.apk"
export BOXDROID_M5_COMPANION_PACKAGE_TO_STOP=org.boxdroid.m5
export BOXDROID_M5_STOP_WAIT_SECS=10

exec "$ROOT/scripts/m5-xbox-boot-android.sh" "$@"
