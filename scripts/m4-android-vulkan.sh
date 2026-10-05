#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIN=478b4f496102379c7eaa7f3ec10e714a703c4300
PACKAGE=org.boxdroid.m3
ACTIVITY="$PACKAGE/.MainActivity"
LAUNCH_COUNT="${BOXDROID_M4_LAUNCH_COUNT:-5}"
WORK_ROOT="${BOXDROID_M4_WORK_ROOT:-$ROOT/build/m4/repro}"
M3_WORK_ROOT="$WORK_ROOT/m3"
RESULTS="$WORK_ROOT/results"

die() { echo "error: $*" >&2; exit 1; }
[[ "$(git -C "$ROOT" branch --show-current)" == android-port ]] || die "must run on android-port"
[[ "$(git -C "$ROOT/upstream/xemu" rev-parse HEAD)" == "$PIN" ]] || die "upstream/xemu is not pinned at $PIN"
command -v adb >/dev/null || die "adb is not on PATH"
command -v jq >/dev/null || die "jq is required to validate the device JSON result"
[[ -s "$ROOT/patches/xemu/0003-m4-android-vulkan-presentation.patch" ]] || die "missing M4 downstream patch"
grep -qx '0001-m2-android-arm64-cross-build.patch' "$ROOT/patches/xemu/series" || die "M2 patch missing from series"
grep -qx '0002-m3-generic-headless-target.patch' "$ROOT/patches/xemu/series" || die "M3 patch missing from series"
grep -qx '0003-m4-android-vulkan-presentation.patch' "$ROOT/patches/xemu/series" || die "M4 patch missing from series"
mkdir -p "$RESULTS"
: > "$RESULTS/summary.txt"

if [[ -n "${ANDROID_SERIAL:-}" ]]; then ADB=(adb -s "$ANDROID_SERIAL");
else
    serial="$(adb devices | awk 'NR > 1 && $2 == "device" {print $1; exit}')"
    [[ -n "$serial" ]] || die "no authorized ADB device"
    ADB=(adb -s "$serial")
fi
"${ADB[@]}" get-state | grep -qx device || die "ADB device is not ready"

# This call reconstructs the pinned M2/M3 source plus the ordered M4 patch,
# links the presenter into libboxdroid.so, assembles the APK, and verifies M3
# once before any surface testing.
BOXDROID_M3_WORK_ROOT="$M3_WORK_ROOT" \
BOXDROID_M3_LAUNCH_COUNT=1 \
BOXDROID_M4_PRESENTER=1 \
    "$ROOT/scripts/m3-headless-android.sh"

APK="$ROOT/android/m3/app/build/outputs/apk/debug/app-debug.apk"
NDK_BIN="${ANDROID_NDK_HOME:-${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}/ndk/30.0.16248370}/toolchains/llvm/prebuilt/darwin-x86_64/bin"
"$NDK_BIN/llvm-readelf" -h -d "$M3_WORK_ROOT/core/android-arm64/libboxdroid.so" > "$RESULTS/libboxdroid-readelf.txt"
"$NDK_BIN/llvm-nm" -D --defined-only "$M3_WORK_ROOT/core/android-arm64/libboxdroid.so" > "$RESULTS/libboxdroid-exports.txt"
grep -q 'Class:.*ELF64' "$RESULTS/libboxdroid-readelf.txt" || die "M4 library is not ELF64"
grep -q 'Machine:.*AArch64' "$RESULTS/libboxdroid-readelf.txt" || die "M4 library is not AArch64"
for symbol in Java_org_boxdroid_m3_MainActivity_nativeM4SurfaceCreated Java_org_boxdroid_m3_MainActivity_nativeM4SurfaceChanged Java_org_boxdroid_m3_MainActivity_nativeM4PresentFrame Java_org_boxdroid_m3_MainActivity_nativeM4SurfaceDestroyed Java_org_boxdroid_m3_MainActivity_nativeM4Diagnostics Java_org_boxdroid_m3_MainActivity_nativeM4Shutdown; do
    grep -q "$symbol" "$RESULTS/libboxdroid-exports.txt" || die "missing M4 JNI export $symbol"
done

successes=0
previous_pid=""
seen_pids=" "
for ((run=1; run<=LAUNCH_COUNT; run++)); do
    run_dir="$RESULTS/run-$run"
    mkdir -p "$run_dir"
    "${ADB[@]}" shell am force-stop "$PACKAGE"
    "${ADB[@]}" shell run-as "$PACKAGE" rm -f files/m4-result.json files/m4-visible.ready
    "${ADB[@]}" logcat -c
    "${ADB[@]}" shell input keyevent 224 >/dev/null 2>&1 || true
    "${ADB[@]}" shell am start -W -n "$ACTIVITY" > "$run_dir/am-start.txt"
    pid="$("${ADB[@]}" shell pidof "$PACKAGE" | tr -d '\r')"
    [[ "$pid" =~ ^[0-9]+$ && "$pid" != "$previous_pid" ]] || die "launch $run did not create exactly one fresh process"
    case "$seen_pids" in
        *" $pid "*) die "launch $run reused PID $pid from an earlier fresh launch" ;;
    esac
    seen_pids+="$pid "
    echo "run=$run pid=$pid previous_pid=$previous_pid" > "$run_dir/process.txt"

    visible=0
    for ((wait=0; wait<120; wait++)); do
        marker="$("${ADB[@]}" shell run-as "$PACKAGE" cat files/m4-visible.ready 2>/dev/null | tr -d '\r' || true)"
        [[ -n "$marker" ]] && { visible=1; break; }
        alive="$("${ADB[@]}" shell pidof "$PACKAGE" | tr -d '\r')"
        [[ "$alive" == "$pid" ]] || break
        sleep 0.5
    done
    if [[ "$visible" == 1 ]]; then
        echo "$marker" > "$run_dir/visible-frame-marker.txt"
        "${ADB[@]}" exec-out screencap -p > "$run_dir/screen.png"
        file "$run_dir/screen.png" > "$run_dir/screen-file.txt"
    fi
    result=""
    for ((wait=0; wait<45; wait++)); do
        result="$("${ADB[@]}" shell run-as "$PACKAGE" cat files/m4-result.json 2>/dev/null | tr -d '\r' || true)"
        [[ -n "$result" ]] && break
        sleep 0.5
    done
    printf '%s\n' "$result" > "$run_dir/m4-result.json"
    post_pid="$("${ADB[@]}" shell pidof "$PACKAGE" | tr -d '\r')"
    echo "process_after_presenter_shutdown=$post_pid" >> "$run_dir/process.txt"
    "${ADB[@]}" logcat -d > "$run_dir/logcat.txt"
    "${ADB[@]}" logcat -b crash -d > "$run_dir/crash-buffer.txt"
    surface_creations="$(grep -Fc 'JAVA_SURFACE_CREATED generation=' "$run_dir/logcat.txt" || true)"
    surface_destructions="$(grep -Fc 'JAVA_SURFACE_DESTROYED generation=' "$run_dir/logcat.txt" || true)"
    if [[ "$visible" == 1 && -s "$run_dir/screen.png" && "$post_pid" == "$pid" ]] && \
       printf '%s' "$result" | jq -e '.status == "PASS" and .successful_acquires == 150 and .submitted_frames == 150 and .successful_presents == 150 and .frame_before_recreation == 75 and .frame_after_recreation == 75 and .failed_presents == 0 and .surface_creations == 2 and .surface_destructions == 2 and .swapchain_creations == 2 and .swapchain_destructions == 2' >/dev/null && \
       [[ "$surface_creations" -eq 2 && "$surface_destructions" -eq 2 ]] && \
       grep -q 'JAVA_SURFACE_CREATED generation=1' "$run_dir/logcat.txt" && \
       grep -q 'JAVA_SURFACE_CREATED generation=2' "$run_dir/logcat.txt" && \
       grep -q 'JAVA_SURFACE_DESTROYED generation=1' "$run_dir/logcat.txt" && \
       grep -q 'JAVA_SURFACE_DESTROYED generation=2' "$run_dir/logcat.txt" && \
       grep -q 'VISIBLE_FRAME_READY generation=2' "$run_dir/logcat.txt" && \
       grep -q 'VULKAN_SHUTDOWN_CLEAN instance=destroyed device=destroyed' "$run_dir/logcat.txt" && \
       ! grep -Eq 'Fatal signal|SIGABRT|FATAL EXCEPTION' "$run_dir/crash-buffer.txt"; then
        successes=$((successes + 1))
        echo "run=$run PASS pid=$pid" | tee -a "$RESULTS/summary.txt"
    else
        echo "run=$run FAIL pid=$pid visible=$visible result=$result" | tee -a "$RESULTS/summary.txt"
        die "M4 presentation failed on run $run; inspect $run_dir"
    fi
    previous_pid="$pid"
done

printf 'M4_FRESH_LAUNCHES=%s\nM4_SUCCESSES=%s\n' "$LAUNCH_COUNT" "$successes" | tee -a "$RESULTS/summary.txt"
[[ "$successes" -eq "$LAUNCH_COUNT" ]] || die "fresh launch validation incomplete"

# Re-run the explicit headless path after all M4 changes.
rm -f "$M3_WORK_ROOT/results/summary.txt"
BOXDROID_M3_WORK_ROOT="$M3_WORK_ROOT" \
BOXDROID_M3_LAUNCH_COUNT=1 \
BOXDROID_M4_PRESENTER=1 \
    "$ROOT/scripts/m3-headless-android.sh"
grep -q 'M3_SUCCESSES=1' "$M3_WORK_ROOT/results/summary.txt" || die "M3 post-M4 regression did not pass"
echo "M4 artifacts: $RESULTS"
