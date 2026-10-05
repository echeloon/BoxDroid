# M4: Android Vulkan presentation and surface lifecycle

M4 validates a BoxDroid-owned Android Vulkan presenter on the Retroid Pocket 5.
It is an instrumented diagnostic, not an Xbox boot or frontend milestone.

## Inputs and implementation boundary

- Official Xemu baseline: `478b4f496102379c7eaa7f3ec10e714a703c4300`
- Android ABI/API: `arm64-v8a`, `aarch64-linux-android`, native API 33/Bionic
- Device: Retroid Pocket 5, Android 13/API 33, Snapdragon 865, Adreno 650
- NDK: `30.0.16248370`, Clang/LLD 21.0.0
- Existing M3 `android/m3` diagnostic Activity and `libboxdroid.so` are reused.
- `native/android/m4/boxdroid-vulkan-presenter.cpp` owns `ANativeWindow`,
  Android WSI, the Vulkan surface/swapchain, synchronization and diagnostics.
- The Java Activity owns Android policy. It creates a `SurfaceView`, sends its
  actual `Surface` through JNI, then removes it and creates another
  `SurfaceView` after 75 presented frames. Its `surfaceDestroyed` callback waits
  for native teardown before the next generation begins.
- The presenter is linked into `libboxdroid.so` only with
  `-Dboxdroid_m4_presenter=true`. Patch 0003 adds that Meson seam and the
  Android/Vulkan system-library dependencies. It does not add Android code to
  Xemu/QEMU core or change the desktop renderer.
- M3 remains callable by launching the same diagnostic Activity with the M3
  intent extra. Loading the shared library does not start either test.

The controlled frame is a Vulkan transfer clear into an acquired swapchain
image, followed by queue submission and `vkQueuePresentKHR`. Generation one is
magenta; generation two is cyan. There is no OpenGL, Canvas, Bitmap, or desktop
OpenGL interop in this path. `VK_KHR_surface` and
`VK_KHR_android_surface` are enabled on the Vulkan instance;
`VK_KHR_swapchain` is enabled on the logical device. The selected queue family
must support graphics and presentation for the actual Android surface.

For each frame, the presenter acquires with a semaphore, records an image
layout transition and clear, submits while waiting on acquisition, signals a
render semaphore, and presents while waiting on that semaphore. It then waits
for queue idle before reusing its single command buffer and semaphores. This is
intentionally conservative and bounded for diagnosis, not a performance
design. Surface teardown waits for the device, destroys the command pool,
semaphores and swapchain, destroys `VkSurfaceKHR`, and only then releases the
`ANativeWindow` reference. A recreated Java `Surface` gets a new native window,
surface and swapchain while the Vulkan instance/device are retained for that
process. The Activity removes the second surface after the diagnostic run and
the native report is written after teardown.

## Device results

The checked-in M0 capability inventory at
[`../m0/results/retroid-pocket-5.json`](../m0/results/retroid-pocket-5.json)
measured the Adreno 650 Vulkan device as API 1.1.128 with the Android surface
extensions and `VK_KHR_swapchain`. It reported one queue family (index 0) with
graphics and compute support, supported surface present modes including FIFO
and MAILBOX, five surface formats, and `VK_IMAGE_USAGE_TRANSFER_DST_BIT` in
surface usage flags. M4 re-queries surface support on every newly created
surface rather than relying on those inventory results.

The first end-to-end M4 device run selected:

| Property | Measured result |
| --- | --- |
| Vulkan device | `Adreno (TM) 650` |
| Queue family | 0; graphics and present |
| Surface format | `VK_FORMAT_R8G8B8A8_UNORM` (37), color space 0 (`SRGB_NONLINEAR`) |
| Present mode | FIFO (2) |
| Swapchain extent | 1920 × 972 pixels, from the active surface capabilities |
| Surface limits | minimum 3 images, maximum 64; usage flags 159 (includes transfer destination) |
| Swapchain images | Requested 4 (`minImageCount + 1`); actual image count 4 |
| Image usage | transfer destination, supported by the queried surface capabilities |

The retained device capture
`build/m4/repro/results/run-1/screen.png` showed a full cyan Vulkan frame on the
device display. The test writes `m4-visible.ready` only after 60 successful
generation-two frames; the host script captures the screen immediately, before
the Activity tears the second surface down.

The run queried five formats (`37, 43, 4, 97, 64`, all color space 0) and four
present modes (`1` MAILBOX, `2` FIFO, plus two driver-specific modes). It
reported 150 successful acquire/submit/present operations: 75 before
and 75 after the real SurfaceView replacement. It created/destroyed two Vulkan
surfaces and two swapchains, with zero failed presents, out-of-date results,
suboptimal results, or surface-lost results. The Android process PID remained
alive after native presenter shutdown. The report and full logcat/crash-buffer
capture are kept under the ignored `build/m4/repro/results/` path.

## Build, install and repeat

Prerequisites are those documented for M3: JDK 17, Android SDK platform/build
tools 36, NDK `30.0.16248370`, Git, Python 3, Ninja, CMake, pkg-config, Rustup,
`jq`, and an authorized ADB device. `libc++_shared.so` comes from that NDK and is
packaged into the diagnostic APK because the presenter is C++.

From the repository root on the configured macOS host:

```sh
git submodule update --init upstream/xemu
export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
export ANDROID_HOME="${ANDROID_HOME:-${ANDROID_SDK_ROOT:?Set ANDROID_HOME or ANDROID_SDK_ROOT}}"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="${ANDROID_NDK_HOME:-$ANDROID_HOME/ndk/30.0.16248370}"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin:$PATH"
JOBS=6 scripts/m4-android-vulkan.sh
```

The script constructs a fresh ignored work root by default, applies
`patches/xemu/series` in order to the exact pinned upstream SHA, reuses the
reproducible M2 dependency/build path, builds and verifies `libboxdroid.so`,
packages/installs the APK, runs an M3 TCG regression, performs five fresh M4
process launches, captures the visible frame, verifies the per-run JSON/log
counters, and runs M3 again after M4. To use another ignored root or launch
count, set `BOXDROID_M4_WORK_ROOT` or `BOXDROID_M4_LAUNCH_COUNT`; set
`ANDROID_SERIAL` if more than one authorized device is attached.

The on-device JSON report for each launch is saved in
`build/m4/repro/results/run-N/m4-result.json`. It includes surface/swapchain
creation and destruction totals, successful acquisitions/submissions/presents,
pre/post-recreation frames, failure counts and WSI status counters. The host
also keeps install/build logs, process PIDs, logcat, crash-buffer output and
screen captures in the same ignored results directory.

## M3 and NV2A boundaries

The M3 test remains an explicit separate mode and executes the generic
AArch64 `virt` test guest through QEMU TCG. M4 invokes it before and after the
presenter test and requires the M3 script's TCG checks to pass.

M4 does not render NV2A output. The current Android runtime target is the
generic AArch64 `virt` target; Xemu's Xbox/NV2A machine remains an i386 target,
and this milestone does not boot Xbox firmware. The M4 result proves a viable
Android Vulkan WSI and presentation boundary to connect to a future renderer
integration, not Xbox graphics output. No firmware or proprietary Xbox data is
included.

## Limitations and acceptance

- The one-command device run currently uses one queue and serial queue-idle
  synchronization for clarity; this is not a throughput-optimized present loop.
- OUT_OF_DATE and SUBOPTIMAL paths recreate the swapchain; SURFACE_LOST is
  counted and returned to the Activity for diagnosis. The Retroid run did not
  naturally produce any of these conditions, so those recovery branches were
  compiled but not exercised by this result.
- No NV2A frame, Xbox firmware execution, controller, audio, storage, networking
  or product UI is part of M4.
- The recorded physical-device run passed M4's controlled presentation,
  lifecycle, fresh-process and M3 regression criteria.
