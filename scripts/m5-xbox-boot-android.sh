#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIN=478b4f496102379c7eaa7f3ec10e714a703c4300
API=33
ABI=arm64-v8a
PACKAGE="${BOXDROID_M5_PACKAGE:-org.boxdroid.m5}"
ACTIVITY="${BOXDROID_M5_ACTIVITY:-$PACKAGE/.MainActivity}"
ANDROID_PROJECT="${BOXDROID_M5_ANDROID_PROJECT:-$ROOT/android/m5}"
WORK_ROOT="${BOXDROID_M5_WORK_ROOT:-$ROOT/build/m5/repro}"
CORE_ROOT="$WORK_ROOT/core"
BUILD="$CORE_ROOT/android-arm64"
RESULTS="${BOXDROID_M5_RESULTS:-$WORK_ROOT/results}"
DEVICE_DIR="/sdcard/Android/data/$PACKAGE/files/m5"
OBSERVE_SECS="${BOXDROID_M5_OBSERVE_SECS:-45}"

die() { echo "error: $*" >&2; exit 1; }
usage() {
    echo "Usage: $0 --bios FILE --mcpx FILE --hdd FILE"
    echo "Stages only into the diagnostic app's package-scoped Android files directory."
}
host_sha256() {
    if command -v sha256sum >/dev/null; then sha256sum "$1" | awk '{print $1}'
    else shasum -a 256 "$1" | awk '{print $1}'
    fi
}

BIOS="" MCPX="" HDD=""
while (($#)); do
    case "$1" in
        --bios) (($# >= 2)) || die "--bios requires a path"; BIOS="$2"; shift 2 ;;
        --mcpx) (($# >= 2)) || die "--mcpx requires a path"; MCPX="$2"; shift 2 ;;
        --hdd) (($# >= 2)) || die "--hdd requires a path"; HDD="$2"; shift 2 ;;
        -h|--help) usage; exit 0 ;;
        *) die "unknown argument: $1" ;;
    esac
done
[[ -n "$BIOS" && -n "$MCPX" && -n "$HDD" ]] || { usage >&2; exit 2; }
for path in "$BIOS" "$MCPX" "$HDD"; do [[ -f "$path" && -r "$path" ]] || die "file is missing or unreadable: $path"; done
[[ "$(wc -c < "$BIOS" | tr -d ' ')" == 1048576 ]] || die "BIOS must be 1 MiB"
[[ "$(wc -c < "$MCPX" | tr -d ' ')" == 512 ]] || die "MCPX must be 512 bytes"
python3 - "$HDD" <<'PY'
import os, struct, sys
p = sys.argv[1]
with open(p, 'rb') as f:
    header = f.read(32)
if len(header) < 32 or header[:4] != b'QFI\xfb':
    raise SystemExit('error: HDD is not a QCOW2 image')
version = struct.unpack('>I', header[4:8])[0]
virtual_size = struct.unpack('>Q', header[24:32])[0]
if version not in (2, 3):
    raise SystemExit(f'error: unsupported QCOW2 version {version}')
if virtual_size == 0:
    raise SystemExit('error: QCOW2 virtual size is zero')
print(f'HDD_FORMAT=qcow2-v{version} VIRTUAL_SIZE={virtual_size}')
PY

[[ "$(git -C "$ROOT" branch --show-current)" == android-port ]] || die "must run on android-port"
[[ "$(git -C "$ROOT/upstream/xemu" rev-parse HEAD)" == "$PIN" ]] || die "upstream/xemu is not pinned at $PIN"
for patch in 0001-m2-android-arm64-cross-build.patch 0002-m3-generic-headless-target.patch 0003-m4-android-vulkan-presentation.patch 0004-m5-android-xbox-headless-core.patch 0005-m5-display-refresh-diagnostics.patch 0006-m5-scanout-black-localization.patch 0007-m5-vulkan-image-content-diagnostics.patch 0008-m5-firmware-storage-provenance.patch 0009-m5-vga-raw-vram-diagnostics.patch 0010-m5-vram-transition-diagnostics.patch 0011-m5-framebuffer-writer-diagnostics.patch 0012-m5-cpu-framebuffer-value-diagnostics.patch 0013-m5-guest-progress-diagnostics.patch 0014-m5-nv2a-vulkan-output-diagnostics.patch; do
    grep -qx "$patch" "$ROOT/patches/xemu/series" || die "patch series is missing $patch"
done

JAVA_HOME="${JAVA_HOME:-$(/usr/libexec/java_home -v 17 2>/dev/null || true)}"
ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"
ANDROID_SDK_ROOT="$ANDROID_HOME"
ANDROID_NDK_HOME="${ANDROID_NDK_HOME:-$ANDROID_HOME/ndk/30.0.16248370}"
NDK_BIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin"
[[ -x "$JAVA_HOME/bin/java" ]] || die "missing JDK 17"
[[ -x "$ANDROID_HOME/platform-tools/adb" ]] || die "missing Android platform-tools"
[[ -x "$NDK_BIN/clang" ]] || die "missing Android NDK 30.0.16248370"
command -v ninja >/dev/null || die "missing Ninja"
export JAVA_HOME ANDROID_HOME ANDROID_SDK_ROOT ANDROID_NDK_HOME
export ANDROID_NDK_ROOT="$ANDROID_NDK_HOME" ANDROID_NATIVE_API_LEVEL="$API"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$NDK_BIN:$PATH"
export BOXDROID_DSP56300_SOURCE="$CORE_ROOT/source/dsp56300"

if [[ -n "${ANDROID_SERIAL:-}" ]]; then ADB=(adb -s "$ANDROID_SERIAL")
else
    count="$(adb devices | awk 'NR > 1 && $2 == "device" {n++} END {print n+0}')"
    [[ "$count" == 1 ]] || die "set ANDROID_SERIAL or connect exactly one authorized device"
    serial="$(adb devices | awk 'NR > 1 && $2 == "device" {print $1; exit}')"
    ADB=(adb -s "$serial")
fi
"${ADB[@]}" get-state | grep -qx device || die "ADB device is not ready"
if [[ -n "${BOXDROID_M5_COMPANION_PACKAGE_TO_STOP:-}" ]]; then
    "${ADB[@]}" shell am force-stop "$BOXDROID_M5_COMPANION_PACKAGE_TO_STOP"
fi

mkdir -p "$RESULTS"
for entry in "bios:$BIOS" "mcpx:$MCPX" "hdd:$HDD"; do
    name="${entry%%:*}"; path="${entry#*:}"
    printf '%s_bytes=%s sha256=%s\n' "$name" "$(wc -c < "$path" | tr -d ' ')" "$(host_sha256 "$path")"
done | tee "$RESULTS/firmware-verification.txt"

BOXDROID_M2_WORK_ROOT="$CORE_ROOT" \
BOXDROID_M2_TARGET_LIST=i386-softmmu \
BOXDROID_M2_EXTRA_CFLAGS= \
BOXDROID_M2_ENABLE_SDL=0 \
BOXDROID_M2_STATIC_PIC=1 \
BOXDROID_M3_RUNTIME=0 \
BOXDROID_M4_PRESENTER=0 \
BOXDROID_M5_XBOX_RUNTIME=1 \
JOBS="${JOBS:-4}" \
    "$ROOT/scripts/m2-android-arm64.sh" | tee "$RESULTS/build.log"
ninja -C "$BUILD" -j"${JOBS:-4}" libboxdroid.so | tee -a "$RESULTS/build.log"

mkdir -p "$BUILD/jniLibs/$ABI"
cp "$BUILD/libboxdroid.so" "$BUILD/jniLibs/$ABI/libboxdroid.so"
cp "$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/aarch64-linux-android/libc++_shared.so" \
   "$BUILD/jniLibs/$ABI/libc++_shared.so"
"$NDK_BIN/llvm-readelf" -h -d -Ws "$BUILD/libboxdroid.so" > "$RESULTS/libboxdroid-readelf.txt"
grep -q 'Class:.*ELF64' "$RESULTS/libboxdroid-readelf.txt" || die "library is not ELF64"
grep -q 'Machine:.*AArch64' "$RESULTS/libboxdroid-readelf.txt" || die "library is not AArch64"
grep -q 'Java_org_boxdroid_m5_MainActivity_nativeXboxStart' "$RESULTS/libboxdroid-readelf.txt" || die "Xbox JNI start symbol is missing"

"$ROOT/android/m5/gradlew" --no-daemon -p "$ANDROID_PROJECT" \
    -Pm5BuildRoot="$BUILD" assembleDebug | tee "$RESULTS/gradle.log"
APK_BUILD="$ANDROID_PROJECT/app/build/outputs/apk/debug/app-debug.apk"
APK="${BOXDROID_M5_APK:-$APK_BUILD}"
if [[ "$APK" != "$APK_BUILD" ]]; then
    mkdir -p "$(dirname "$APK")"
    cp "$APK_BUILD" "$APK"
fi
[[ -s "$APK" ]] || die "APK missing after Gradle build"
"${ADB[@]}" install -r "$APK" | tee "$RESULTS/install.txt"

"${ADB[@]}" shell mkdir -p "$DEVICE_DIR"
"${ADB[@]}" push "$BIOS" "$DEVICE_DIR/bios.bin" | tee "$RESULTS/stage-bios.txt"
"${ADB[@]}" push "$MCPX" "$DEVICE_DIR/mcpx.bin" | tee "$RESULTS/stage-mcpx.txt"
"${ADB[@]}" push "$HDD" "$DEVICE_DIR/hdd.qcow2" | tee "$RESULTS/stage-hdd.txt"
for name in bios mcpx hdd; do
    case "$name" in bios) local_path="$BIOS"; remote_name=bios.bin;; mcpx) local_path="$MCPX"; remote_name=mcpx.bin;; hdd) local_path="$HDD"; remote_name=hdd.qcow2;; esac
    remote_hash="$("${ADB[@]}" shell sha256sum "$DEVICE_DIR/$remote_name" | awk '{print $1}' | tr -d '\r')"
    [[ "$remote_hash" == "$(host_sha256 "$local_path")" ]] || die "$name device copy hash mismatch"
    printf '%s_device_sha256=%s\n' "$name" "$remote_hash" | tee -a "$RESULTS/firmware-verification.txt"
done

"${ADB[@]}" shell am force-stop "$PACKAGE"
"${ADB[@]}" logcat -c
VIDEO_DEVICE=/sdcard/Movies/boxdroid-m5-boot.mp4
"${ADB[@]}" shell mkdir -p /sdcard/Movies
"${ADB[@]}" shell rm -f "$VIDEO_DEVICE"
"${ADB[@]}" shell screenrecord --size 1280x720 --bit-rate 2000000 \
    --time-limit "$OBSERVE_SECS" "$VIDEO_DEVICE" \
    > "$RESULTS/screenrecord.txt" 2>&1 &
screenrecord_pid=$!
sleep 0.3
"${ADB[@]}" shell am start -W -n "$ACTIVITY" | tee "$RESULTS/launch.txt"
pid="$("${ADB[@]}" shell pidof "$PACKAGE" | tr -d '\r')"
[[ "$pid" =~ ^[0-9]+$ ]] || die "diagnostic process did not start"
echo "pid=$pid" > "$RESULTS/process.txt"
SECONDS=0
# Sample the early firmware video window densely enough to catch short boot
# visuals, then retain the established dashboard/stability checkpoints.
for capture_second in 1 2 3 4 5 6 8 10 12 15 18 20 22 25 30 35 40; do
    (( capture_second < OBSERVE_SECS )) || continue
    delay=$((capture_second - SECONDS))
    (( delay > 0 )) && sleep "$delay"
    "${ADB[@]}" exec-out screencap -p > "$RESULTS/screen-${capture_second}s.png"
    echo "capture_second=$capture_second file=screen-${capture_second}s.png" | tee -a "$RESULTS/captures.txt"
done
remaining=$((OBSERVE_SECS - SECONDS))
(( remaining > 0 )) && sleep "$remaining"
"${ADB[@]}" exec-out screencap -p > "$RESULTS/screen.png"
wait "$screenrecord_pid" || true
"${ADB[@]}" pull "$VIDEO_DEVICE" "$RESULTS/boot-video.mp4" \
    | tee "$RESULTS/screenrecord-pull.txt"
[[ -s "$RESULTS/boot-video.mp4" ]] || die "boot video capture is missing or empty"
"${ADB[@]}" shell rm -f "$VIDEO_DEVICE"
"${ADB[@]}" shell input keyevent KEYCODE_BACK > "$RESULTS/stop-trigger.txt" 2>&1 || true
sleep "${BOXDROID_M5_STOP_WAIT_SECS:-2}"
"${ADB[@]}" logcat -d -s BoxDroidM5:I BoxDroidM4:I BoxDroidM52:I '*:S' > "$RESULTS/logcat.txt"
"${ADB[@]}" logcat -b crash -d > "$RESULTS/crash-buffer.txt"
"${ADB[@]}" exec-out run-as "$PACKAGE" cat files/m5-qemu.log > "$RESULTS/qemu-exec-trace.log" 2>/dev/null || true
"${ADB[@]}" shell am force-stop "$PACKAGE"

if grep -q 'XBOX_INIT_RESULT=0' "$RESULTS/logcat.txt" && \
   grep -q 'CPU Reset (CPU 0)' "$RESULTS/qemu-exec-trace.log" && \
   grep -q 'Trace 0:' "$RESULTS/qemu-exec-trace.log"; then
    echo "M5_RUNTIME=PASS machine_init=1 tcg_exec_trace=1" | tee "$RESULTS/result.txt"
else
    echo "M5_RUNTIME=FAIL machine_init_or_tcg_trace_missing" | tee "$RESULTS/result.txt"
    exit 1
fi

if grep -q 'NV2A_SCANOUT_READBACK_COMPLETE' "$RESULTS/logcat.txt" && \
   grep -q 'XBOX_NV2A_FRAME_PRESENT count=' "$RESULTS/logcat.txt"; then
    echo "M5_NV2A_FRAME=OBSERVED; inspect the local screenshot for a genuine firmware checkpoint" | tee -a "$RESULTS/result.txt"
    echo "M5_RESULT=PARTIAL_VISUAL_REVIEW_REQUIRED" | tee -a "$RESULTS/result.txt"
    exit 2
fi
echo "M5_RESULT=PARTIAL_NO_NV2A_SCANOUT" | tee -a "$RESULTS/result.txt"
echo "See $RESULTS/logcat.txt, $RESULTS/qemu-exec-trace.log, and $RESULTS/screen.png; no Xbox boot checkpoint was claimed."
exit 2
