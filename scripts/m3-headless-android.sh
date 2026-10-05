#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIN=478b4f496102379c7eaa7f3ec10e714a703c4300
API=33
ABI=arm64-v8a
PACKAGE=org.boxdroid.m3
ACTIVITY="$PACKAGE/.MainActivity"
JAVA_HOME="${JAVA_HOME:-$(/usr/libexec/java_home -v 17 2>/dev/null || true)}"
ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/Library/Android/sdk}}"
ANDROID_SDK_ROOT="$ANDROID_HOME"
ANDROID_NDK_HOME="${ANDROID_NDK_HOME:-$ANDROID_HOME/ndk/30.0.16248370}"
ANDROID_SERIAL="${ANDROID_SERIAL:-}"
LAUNCH_COUNT="${BOXDROID_M3_LAUNCH_COUNT:-5}"
WORK_ROOT="${BOXDROID_M3_WORK_ROOT:-$ROOT/build/m3/repro}"
CORE_ROOT="$WORK_ROOT/core"
BUILD="$CORE_ROOT/android-arm64"
HARNESS_INPUT="$WORK_ROOT/harness-input"
RESULTS="$WORK_ROOT/results"
NDK_BIN="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin"

die() { echo "error: $*" >&2; exit 1; }

[[ "$(git -C "$ROOT" branch --show-current)" == android-port ]] || die "must run on android-port"
[[ "$(git -C "$ROOT/upstream/xemu" rev-parse HEAD)" == "$PIN" ]] || die "upstream/xemu is not pinned at $PIN"
[[ -x "$JAVA_HOME/bin/java" ]] || die "missing JDK at $JAVA_HOME"
[[ -x "$ANDROID_HOME/platform-tools/adb" ]] || die "missing adb under $ANDROID_HOME"
[[ -x "$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/clang" ]] || die "missing installed Android NDK"
[[ -x "$ROOT/android/m3/gradlew" ]] || die "missing Android M3 Gradle wrapper"
command -v ninja >/dev/null || die "missing Ninja"

export JAVA_HOME ANDROID_HOME ANDROID_SDK_ROOT ANDROID_NDK_HOME
export ANDROID_NDK_ROOT="$ANDROID_NDK_HOME"
export ANDROID_NATIVE_API_LEVEL="$API"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$NDK_BIN:$PATH"

if [[ -n "$ANDROID_SERIAL" ]]; then
    ADB=(adb -s "$ANDROID_SERIAL")
else
    DEVICE_COUNT="$(adb devices | awk 'NR > 1 && $2 == "device" {n++} END {print n+0}')"
    [[ "$DEVICE_COUNT" -eq 1 ]] || die "expected exactly one authorized ADB device; found $DEVICE_COUNT"
    ANDROID_SERIAL="$(adb devices | awk 'NR > 1 && $2 == "device" {print $1; exit}')"
    ADB=(adb -s "$ANDROID_SERIAL")
fi
"${ADB[@]}" get-state | rg -q '^device$' || die "ADB device is not authorized/ready"

mkdir -p "$RESULTS" "$HARNESS_INPUT/jniLibs/$ABI" "$HARNESS_INPUT/assets"
: > "$RESULTS/summary.txt"

BOXDROID_M2_WORK_ROOT="$CORE_ROOT" \
BOXDROID_M2_TARGET_LIST=aarch64-softmmu \
BOXDROID_M2_EXTRA_CFLAGS= \
BOXDROID_M2_ENABLE_SDL=0 \
BOXDROID_M2_STATIC_PIC=1 \
BOXDROID_M3_RUNTIME=1 \
BOXDROID_M4_PRESENTER="${BOXDROID_M4_PRESENTER:-0}" \
JOBS="${JOBS:-4}" \
    "$ROOT/scripts/m2-android-arm64.sh"

ninja -C "$BUILD" -j"${JOBS:-4}" libboxdroid.so

"$NDK_BIN/clang" --target=aarch64-none-elf -fuse-ld=lld -nostdlib \
    -Wl,-Ttext=0x40080000 -Wl,-e,_start -Wl,--build-id=none \
    "$ROOT/native/android/m3/tcg-guest.S" -o "$HARNESS_INPUT/assets/guest.elf"
cp "$BUILD/libboxdroid.so" "$HARNESS_INPUT/jniLibs/$ABI/libboxdroid.so"
if [[ "${BOXDROID_M4_PRESENTER:-0}" == 1 ]]; then
    libcxx_shared="$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/lib/aarch64-linux-android/libc++_shared.so"
    [[ -s "$libcxx_shared" ]] || die "missing NDK ARM64 libc++_shared.so: $libcxx_shared"
    cp "$libcxx_shared" "$HARNESS_INPUT/jniLibs/$ABI/libc++_shared.so"
fi

"$NDK_BIN/llvm-readelf" -h -d "$BUILD/libboxdroid.so" > "$RESULTS/libboxdroid-readelf.txt"
"$NDK_BIN/llvm-nm" -D --defined-only "$BUILD/libboxdroid.so" > "$RESULTS/libboxdroid-exports.txt"
rg -q 'Class:.*ELF64' "$RESULTS/libboxdroid-readelf.txt" || die "libboxdroid.so is not ELF64"
rg -q 'Machine:.*AArch64' "$RESULTS/libboxdroid-readelf.txt" || die "libboxdroid.so is not AArch64"
rg -q 'SONAME.*libboxdroid.so' "$RESULTS/libboxdroid-readelf.txt" || die "unexpected/missing SONAME"
rg -q 'Java_org_boxdroid_m3_MainActivity_nativeRunTcgTest' "$RESULTS/libboxdroid-exports.txt" || die "missing JNI entry point"
for symbol in boxdroid_runtime_initialize boxdroid_runtime_run boxdroid_runtime_request_shutdown; do
    rg -q "$symbol" "$RESULTS/libboxdroid-exports.txt" || die "missing exported lifecycle API: $symbol"
done
if rg -q ' T (qemu_init|qemu_main_loop|qemu_cleanup)$' "$RESULTS/libboxdroid-exports.txt"; then
    die "QEMU internals leaked through the shared-library ABI"
fi

"$ROOT/android/m3/gradlew" --no-daemon \
    -Pm3BuildRoot="$HARNESS_INPUT" -p "$ROOT/android/m3" assembleDebug
APK="$ROOT/android/m3/app/build/outputs/apk/debug/app-debug.apk"
[[ -s "$APK" ]] || die "Gradle did not produce the diagnostic APK"
"${ADB[@]}" install -r "$APK"

previous_pid=""
successes=0
failures=0
for ((run = 1; run <= LAUNCH_COUNT; run++)); do
    run_dir="$RESULTS/run-$run"
    mkdir -p "$run_dir"
    "${ADB[@]}" shell am force-stop "$PACKAGE"
    "${ADB[@]}" shell run-as "$PACKAGE" rm -f files/m3-result.txt files/guest-uart.log files/qemu-tcg.log files/qemu-tcg.log.stderr
    "${ADB[@]}" logcat -c
    "${ADB[@]}" shell am start -W -n "$ACTIVITY" --es boxdroid.mode m3 > "$run_dir/am-start.txt"
    pid="$("${ADB[@]}" shell pidof "$PACKAGE" | tr -d '\r')"
    echo "run=$run pid=$pid previous_pid=$previous_pid" | tee "$run_dir/process.txt"
    [[ -n "$pid" ]] || die "app process did not start on run $run"
    [[ "$pid" != "$previous_pid" ]] || die "expected a fresh process on run $run"

    result=""
    for ((wait = 0; wait < 60; wait++)); do
        result="$("${ADB[@]}" shell run-as "$PACKAGE" cat files/m3-result.txt 2>/dev/null | tr -d '\r' || true)"
        [[ -n "$result" ]] && break
        sleep 0.5
    done
    post_pid="$("${ADB[@]}" shell pidof "$PACKAGE" | tr -d '\r')"
    echo "process_after_native_shutdown=$post_pid" | tee -a "$run_dir/process.txt"
    "${ADB[@]}" logcat -d > "$run_dir/logcat.txt"
    "${ADB[@]}" logcat -b crash -d > "$run_dir/crash-buffer.txt"
    "${ADB[@]}" exec-out run-as "$PACKAGE" cat files/guest-uart.log > "$run_dir/guest-uart.log" 2>/dev/null || true
    "${ADB[@]}" exec-out run-as "$PACKAGE" cat files/qemu-tcg.log > "$run_dir/qemu-tcg.log" 2>/dev/null || true
    "${ADB[@]}" exec-out run-as "$PACKAGE" cat files/qemu-tcg.log.stderr > "$run_dir/qemu-stderr.log" 2>/dev/null || true

    if [[ "$result" == *"M3_RESULT=PASS"* ]] && \
       [[ "$post_pid" == "$pid" ]] && \
       rg -q 'BOXDROID_TCG_PASS=42' "$run_dir/guest-uart.log" && \
       rg -q 'Trace 0:' "$run_dir/qemu-tcg.log" && \
       rg -q 'TCG_GUEST_RESULT marker=BOXDROID_TCG_PASS=42' "$run_dir/logcat.txt" && \
       rg -q 'TCG_JIT_MAP .* r-xs .* /memfd:tcg-jit' "$run_dir/logcat.txt" && \
       rg -q 'TCG_JIT_MAP .* rw-s .* /memfd:tcg-jit' "$run_dir/logcat.txt" && \
       rg -q 'SIGNAL_DELIVERY_RETURN signal=SIGTERM rc=0' "$run_dir/logcat.txt" && \
       rg -q 'RUNTIME_STOP status=0 guest_passed=1 watchdog=0' "$run_dir/logcat.txt" && \
       ! rg -q 'Fatal signal|FORTIFY|SIGABRT' "$run_dir/crash-buffer.txt"; then
        successes=$((successes + 1))
        echo "run=$run PASS result='$result'" | tee -a "$RESULTS/summary.txt"
    else
        failures=$((failures + 1))
        echo "run=$run FAIL result='$result'" | tee -a "$RESULTS/summary.txt"
    fi
    previous_pid="$pid"
done

printf 'M3_FRESH_LAUNCHES=%s\nM3_SUCCESSES=%s\nM3_FAILURES=%s\n' \
    "$LAUNCH_COUNT" "$successes" "$failures" | tee -a "$RESULTS/summary.txt"
[[ "$successes" -eq "$LAUNCH_COUNT" && "$failures" -eq 0 ]] || die "one or more on-device M3 tests failed; see $RESULTS"
echo "M3 artifacts and per-launch evidence: $RESULTS"
