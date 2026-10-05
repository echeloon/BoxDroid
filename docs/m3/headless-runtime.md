# M3: headless Android runtime

M3 proves that the pinned Xemu/QEMU core can be loaded into an Android process,
run AArch64 guest instructions through AArch64 TCG, and shut down on the first
BoxDroid device. It is a diagnostic harness. It does not boot Xbox hardware,
load firmware, present graphics, or provide a product frontend.

## Pinned inputs and target

- Official source: `https://github.com/xemu-project/xemu.git`
- Xemu baseline: `478b4f496102379c7eaa7f3ec10e714a703c4300`
- BoxDroid baseline before M3: `9398dcad3b5cf7b8632310a9225d1c00aedfeaa1`
- Android ABI: `arm64-v8a` (`aarch64-linux-android`)
- Native API: 33; APK minimum API 26 and target API 33; device: Android 13/API 33
- NDK: `30.0.16248370`; NDK Clang/LLD: 21.0.0
- Host tools used: macOS arm64, JDK 17.0.20.1, Gradle 8.13, Android Gradle
  Plugin 8.13.2, SDK compile/build tools 36/36.0.0

The source baseline remains the `upstream/xemu` submodule. Patches in
`patches/xemu/series` are applied to a detached build worktree by the M2/M3
scripts; BoxDroid does not edit the submodule checkout.

## Runtime and test design

`android/m3` is a small Java Activity harness. It copies a freestanding guest
asset to app-private storage, calls a JNI method exported by `libboxdroid.so`,
and writes a result file for the host test script. There is no separate JNI
library. The C lifecycle API in `native/android/m3/boxdroid-runtime.h` exposes
`boxdroid_runtime_initialize`, `boxdroid_runtime_run`, and
`boxdroid_runtime_request_shutdown`; loading the library has no startup side
effect. The shared target hides symbols from its linked static archives so
QEMU internals are not part of the public dynamic ABI.

Initialization supplies QEMU with a generic `virt` machine, one Cortex-A57 CPU,
64 MiB, no default devices, no display or monitor, a file-backed PL011 UART,
and the bundled test ELF. It explicitly requests `-accel tcg,split-wx=on`.
This avoids Xbox BIOS and default-device firmware requirements. The normal
desktop `main()` is not called. After `qemu_init()`, the BoxDroid runtime
transfers QEMU's BQL and replay-lock ownership, runs `qemu_main_loop()`, calls
`qemu_cleanup()`, joins its watcher pthread, and returns the result to Java.
QEMU's Android signal handlers are installed during initialization; the test
watcher delivers `SIGTERM` after observing the guest result to exercise the
normal signal-driven main-loop stop path.

The guest computes `19 + 23`, compares the computed value with 42, and branches
to a distinct success/failure UART string. It writes through the `virt` PL011
register at `0x09000000`, then waits. Success requires all of the following:
the expected UART bytes, QEMU's `in_asm,exec` translation trace with guest PCs
starting at `0x40080000`, the observed marker in the native watcher, clean
main-loop return, and no crash-buffer native fatal signal. This is evidence of
guest instructions being translated and executed by QEMU TCG, rather than just
TCG initialization or code-buffer allocation.

## Reproduce from a clean checkout

Install the host/Android prerequisites already used by M0/M2: Git, Python 3,
Ninja, CMake, pkg-config, Rustup/Cargo (host tools), JDK 17, Android SDK
platform-tools/build-tools 36, and NDK `30.0.16248370`. The scripts pin Meson
1.9.0 and vcpkg commit `a42757564758c60651ebc616d9b000b7b91249ef`; vcpkg builds
the M2 Android dependencies as needed. No Android target executable is run on
the Mac. The tiny guest is compiled by NDK Clang with the bare-metal
`aarch64-none-elf` target.

From the repository root on the configured Mac, with one authorized Android
device connected:

```sh
git submodule update --init upstream/xemu
export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
export ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:?Set ANDROID_HOME or ANDROID_SDK_ROOT to the installed SDK}}"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="${ANDROID_NDK_HOME:-$ANDROID_HOME/ndk/30.0.16248370}"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin:$PATH"
JOBS=6 scripts/m3-headless-android.sh
```

The script checks branch and upstream SHA, builds the `aarch64-softmmu` M2
archives from a fresh detached source worktree, applies the ordered patch
series, builds `libboxdroid.so`, verifies ELF/ABI/SONAME/exports, compiles the
guest, assembles the APK, installs it, and performs five fresh-process launches
by default. Override `BOXDROID_M3_LAUNCH_COUNT` to choose another count,
`ANDROID_SERIAL` when multiple ADB devices are attached, or
`BOXDROID_M3_WORK_ROOT` to choose another ignored build root. Full per-run
logcat, crash buffer, UART output, QEMU trace, PID, readelf and export evidence
is written under `build/m3/repro/results/` by default. Build outputs are
ignored and are not source inputs. A pass also requires that the same Android
process PID remains alive after the native runtime returns.

To repeat against the already reconstructed build rather than a fresh build
root, use for example:

```sh
BOXDROID_M3_WORK_ROOT="$PWD/build/m3/repro" JOBS=6 scripts/m3-headless-android.sh
```

Each test pass is a force-stop followed by a new Activity process. Same-process
QEMU restart is intentionally unsupported: QEMU and Xemu retain process-global
state after cleanup.

## Device evidence (Retroid Pocket 5)

Measured from the attached device with ADB: manufacturer `Moorechip`, model
`Retroid Pocket 5`, SoC `SM8250`/Qualcomm, hardware `qcom`, Android 13/API 33,
ABI `arm64-v8a` (with 32-bit ABIs also advertised), and 4096-byte pages.

The final M3 acceptance run used
`BOXDROID_M3_WORK_ROOT="$PWD/build/m3/final-clean" JOBS=6 scripts/m3-headless-android.sh`.
It built and installed the debug APK, then passed five fresh launches with five
distinct PIDs. Every run reported
`M3_RESULT=PASS native_result=0`, UART `BOXDROID_TCG_PASS=42`, QEMU TCG traces
including translated blocks at guest PCs `0x40080000`, `0x40080014`, and
`0x40080020`, signal delivery `SIGTERM` returning 0, and
`RUNTIME_STOP status=0 guest_passed=1 watchdog=0`. For each run the app PID
remained unchanged after native return. No fatal signal or abort appeared in
the cleared Android crash buffer. Per-run evidence is under the ignored
`build/m3/final-clean/results/` directory on the test host.

With split W^X requested explicitly, `/proc/self/maps` reported the same
`/memfd:tcg-jit` backing object mapped as `r-xs` (executable, not writable) and
`rw-s` (writable, not executable), plus its guard page. Thus this run exercised
QEMU's separate writable/executable aliases under Android 13 without root or
security-setting changes. `tcg/region.c` uses `qemu_memfd_alloc("tcg-jit", ...)`
for this path; the downstream M2 patch enables the Bionic `memfd_create`
path in `util/memfd.c`.

The linked library is ELF64, machine AArch64, type `DYN`, SONAME
`libboxdroid.so`. Its Android dynamic dependencies are `libm.so`, `libdl.so`,
`liblog.so`, and `libc.so`. `llvm-nm -D --defined-only` reports exactly four
exports: the JNI call and the three BoxDroid lifecycle functions. QEMU's
`qemu_init`, `qemu_main_loop`, and `qemu_cleanup` are hidden from the public ABI
by `native/android/m3/boxdroid.map`. The native library is large because this
diagnostic links the selected QEMU core statically into one shared object; APK
size and dead-code reduction are not M3 goals.

## Scope, caveats, and result

- The guest uses the generic QEMU `virt` AArch64 machine, not the Xbox/i386
  machine. M3 proves Android ARM64 TCG and embedding foundations, not Xbox boot
  compatibility or emulation performance.
- `qemu_init()` still contains upstream fatal paths that can terminate the
  process for invalid device/configuration setup. M3 validates its controlled
  paths before initialization and does not claim to make arbitrary QEMU init
  failures recoverable.
- The lifecycle is one run per Android process. Fresh-process relaunch passed;
  in-process restart was not tested or promised.
- Android's standard TextView harness emitted a platform OpenGLRenderer warning
  about swap behavior in logcat. The M3 native target has no desktop GL, Vulkan
  presenter, SDL, or libpcap dependency; no graphics presentation is exercised.
- No BIOS, MCPX, HDD image, game, firmware, key, or other proprietary Xbox data
  is included.

M3 acceptance is **PASS** for the criteria stated in the roadmap on the
Retroid Pocket 5. The complete machine-local logs and binary inspection files
are under the ignored `build/m3/` directory; the source repository records the
reproducer and the measured summary, not machine-generated test artifacts.
