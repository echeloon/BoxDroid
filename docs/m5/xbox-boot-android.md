# M5: Android Xbox boot bring-up

M5 currently reaches **PARTIAL**. The Android ARM64 library initializes the
official Xemu Xbox machine, accepts the supplied MCPX/BIOS/HDD paths, starts
i386 guest execution through AArch64 TCG, and initializes Xemu's NV2A Vulkan
renderer plus the M4 Android Vulkan presenter. A bounded QEMU display refresh
callback now drives recurring NV2A scanout attempts. The Retroid run reached
color-surface lookup, Vulkan readback and presenter submission, but the first
Xbox-derived pixels were entirely black and the captured screen remained
black. No Xbox boot checkpoint has been demonstrated. The diagnostic rejects
QEMU's placeholder console surface instead of presenting it as Xbox output.

## Baseline and boundaries

- BoxDroid base: M4 commit `54dd29e5a00bbfc8a41baacdad9e4c2d56d5f3f6`.
- Xemu source: official `https://github.com/xemu-project/xemu.git`, pinned at
  `478b4f496102379c7eaa7f3ec10e714a703c4300`.
- Android target: `arm64-v8a`, `aarch64-linux-android`, API 33, Bionic.
- NDK: `30.0.16248370`; Clang/LLD 21.0.0.
- Ordered downstream patches: M2, M3, M4, then
  `0004-m5-android-xbox-headless-core.patch`, followed by
  `0005-m5-display-refresh-diagnostics.patch` and
  `0006-m5-scanout-black-localization.patch`.

The Xemu changes remain in the downstream patch series. Android lifecycle,
firmware staging, JNI and Vulkan WSI code live under `native/android/m5` and
`android/m5`. The diagnostic has no UI beyond a surface and status text. It
does not bundle firmware or stage it into Gradle assets.

## Reproduce the device run

On the supported macOS host, provide readable local files explicitly. The
script checks the BIOS/MCPX sizes and QCOW2 header, prints host SHA-256 values,
builds the pinned source plus patch series, installs the diagnostic, stages
copies under the app's package-scoped Android files directory, verifies the
device hashes, launches the Xbox machine and captures a screenshot and logs.
The source files are opened read-only by the script and are not copied into the
repository or APK.

```sh
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/30.0.16248370"
export PATH="$JAVA_HOME/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin:$PATH"

./scripts/m5-xbox-boot-android.sh \
  --bios /path/to/your/Complex_4627.bin \
  --mcpx /path/to/your/mcpx_1.0.bin \
  --hdd /path/to/your/xbox_hdd.qcow2
```

Set `ANDROID_SERIAL` if more than one ADB device is connected. Build output,
firmware verification, device logs, QEMU execution trace and screenshot are
written below the ignored `build/m5/repro/results/` directory. The script exits
with status 2 after a successful diagnostic run when no NV2A scanout was
observed; that is a measured incomplete boot, not a successful M5 checkpoint.

The Android copy path is
`/sdcard/Android/data/org.boxdroid.m5/files/m5/`. It is app-scoped external
storage used only for this bring-up. To remove the staged test data, uninstall
the diagnostic app or remove that app-specific directory. Do not copy those
files into BoxDroid source, assets or release packages.

## Current Retroid evidence

Physical device: Retroid Pocket 5, Android 13/API 33, Snapdragon 865, Adreno
650. The tested native library is ELF64/AArch64. The Android Vulkan surface and
swapchain are initialized by the M4 presenter; Xemu's NV2A Vulkan stages reach
buffer, surface, shader, pipeline, texture, compute and display initialization.
The Android build caps each NV2A compute scratch allocation at 64 MiB because
the upstream desktop reservation is 800 MiB per allocation and caused Android
low-memory termination during renderer startup. This is an Android-only
downstream change; desktop sizing remains unchanged.

The refresh experiment used the same pinned-source M5 script, supplied local
files, and 45-second observation window. On the latest run, Xbox machine
initialization returned successfully. The local QEMU `exec` trace continued to
show Xbox x86 guest translation/execution under AArch64 TCG; it records guest
PCs and host translation-block addresses without instruction-byte
disassembly. This is guest execution evidence, not firmware boot completion.

The diagnostic registered `dpy_refresh` with QEMU's existing display listener
at `GUI_REFRESH_INTERVAL_DEFAULT` (16 ms). Its callback calls
`graphic_hw_update(dcl->con)`; no polling thread was added. Over the 45-second
observation it counted 2,379 refresh callbacks and 2,379 calls to
`graphic_hw_update()`. Guest display programming was observed: 303 PCRTC start
writes, 7 relevant VGA CRTC writes, PGRAPH color-DMA/format/pitch/color-offset
method counts of 3/559/451/451, and 12 color surface bindings.

The scanout summary counted 55 framebuffer lookups: 53 misses and 2 hits.
Both hits reached 640x480 Vulkan readback, and both readbacks completed. The
BoxDroid display callback and presenter accepted two Xbox-derived frames. The
first frame log reported `nonblack_pixels=0` over 307,200 pixels (hash
`c29a7452cec88383`). The device screenshot at
`build/m5/refresh-test/results-second/screen.png` was fully black apart from
the Android navigation bar. Thus the missing recurring refresh did suppress
later scanout attempts, but enabling it did not produce visible Xbox imagery
in this run. The first `NV2A_SCANOUT_SURFACE_MISSING` marker was the initial
placeholder lookup at address 0, pitch 0, extent 8x1; the final counters show
that later lookups then included both hits and misses. The diagnostic emits
that marker and readback markers once each rather than once per refresh.

This evidence rules out a guest that never writes display state and rules out a
permanent absence of color surfaces. It also shows that readback reaches the
BoxDroid presenter. Since the presented source pixels were all black, the next
diagnosis should focus on why the guest-produced NV2A scanout contents are
black; it is not yet evidence of a genuine Xbox boot frame. No dashboard, boot
animation or equivalent checkpoint was reached. The HDD path was supplied as
a QCOW2 IDE disk and QEMU initialization accepted the device configuration,
but guest IDE reads have not yet been confirmed independently. All three
device-side image SHA-256 values matched their local inputs. The captured
Android crash buffer contained no records.

The earlier M5 run observed `qemu_cleanup()` stalling in `vm_shutdown()` while
waiting for Xbox vCPU threads to pause; `tcg,thread=single` did not resolve
that observation. In the two refresh-enabled runs, closing the Activity instead
produced `XBOX_QEMU_LOOP_RETURN status=0`, `XBOX_STOP_RESULT=0`, and
`VULKAN_SHUTDOWN_CLEAN`. Shutdown was not modified as part of this experiment.
The changed behavior has not been isolated or repeated enough to call the
shutdown path reliably resolved. Both captured Android crash buffers were
empty.

## Bounded scanout black localization

The follow-up Retroid run used the same script and 45-second observation window.
It sampled at most 4 MiB once at each pixel-data boundary and did not change
surface selection, Vulkan synchronization, or presenter behavior. Results:

| Boundary | Evidence |
| --- | --- |
| Selected NV2A binding | PCRTC `0x32a4000`, line offset `0xa00`, lookup `0x32a4a00`; binding `[0x32a4000,0x33d0000)`, delta `0xa00`, pitch 2560, 640×480, format `0x8` / VkFormat 44; `draw_dirty=1`, `upload_pending=0`, `initialized=1`, `cleared=0`, frame time 1, draw time 4 |
| Download decision | 2 waits; 1 dirty/requested, 1 skipped, 1 actual GPU download after command completion and mapped-memory invalidation |
| Vulkan staging readback | 1,228,800 sampled bytes; 0 nonzero bytes; hash `f3ee4d06bf3e0383` |
| Xbox VRAM after copy | 1,228,800 sampled bytes; 0 nonzero bytes; hash `f3ee4d06bf3e0383` |
| QEMU DisplaySurface before pixman | 1,228,800 sampled bytes; 0 nonzero bytes; hash `f3ee4d06bf3e0383`; format `0x20020888`, stride 2560, 640×480, flags 0, direct VRAM backing |
| BoxDroid RGBA after pixman | 1,228,800 sampled bytes; 307,200 nonzero bytes from alpha; 0 nonblack pixels; hash `c29a7452cec88383` |
| Presenter input | Same RGBA buffer passed directly to the presenter; no separate sample was needed |

The first sampled boundary, Vulkan staging, was already all zero. The matching
VRAM and DisplaySurface hashes show that the subsequent CPU copy and direct VGA
surface path preserved those bytes; pixman only supplied opaque alpha. Thus
there is no proven nonblack pixel boundary. This localizes the black image to
the selected GPU surface contents or the GPU-to-staging result, before the
VRAM/VGA/pixman/presenter handoff. The available evidence does not distinguish
black guest rendering from selecting a surface whose contents do not contain
the guest image.

After a successful lookup, one bounded later miss recorded PCRTC `0x3c00000`,
line offset `0xa00`, lookup `0x3c00a00`. The nearest active color binding was
`[0x3628000,0x3880000)`, pitch 5120, 1280×480, format `0x8`; it did not cover
the lookup address. During this run the summary counted 53 lookups, 2 hits and
51 misses. The device screenshot remained black and no boot checkpoint was
reached. The crash buffer was empty; the diagnostic closed with status 0 and
clean Vulkan shutdown. M5 remains PARTIAL.

## Verified and outstanding

| M5 item | Current result |
| --- | --- |
| Android `libboxdroid.so` load and Xbox machine initialization | Verified |
| MCPX/BIOS paths and sizes; image copies hash-verified on device | Verified |
| Xbox x86 reset path enters AArch64-hosted TCG | Verified by CPU reset and executed-TB trace records |
| QCOW2 path accepted in IDE drive configuration | Verified at QEMU initialization; guest reads not confirmed |
| NV2A Vulkan renderer initialization | Verified |
| Recurring display refresh / `graphic_hw_update()` | Verified: 2,379 / 2,379 calls in 45 s |
| Guest display-register writes and color surface bindings | Verified: PCRTC/VGA/PGRAPH writes; 12 color bindings |
| NV2A framebuffer lookup/readback | Verified: 2 hits; 1 GPU download performed, 1 subsequent hit skipped it; 51 misses |
| Android presenter handoff | Verified: 2 Xbox-path frames accepted; sampled source had 0 nonblack pixels |
| Visible Xbox-produced image | Not observed; device screenshot was black |
| Visible Xbox boot checkpoint | Not reached |
| Clean embedded QEMU shutdown | Observed in two refresh-enabled runs; earlier stall remains unexplained |
| Repeated boot to checkpoint | Not applicable until a checkpoint is reached |

M3/M4 regressions must be run from a fresh build root after changing the patch
series. M5 is not accepted until real guest-produced NV2A frames are presented
and a genuine boot checkpoint is visible on the Retroid.
