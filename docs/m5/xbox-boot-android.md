# M5: Android Xbox boot bring-up

M5 currently reaches **PARTIAL**. The Android ARM64 library initializes the
official Xemu Xbox machine, accepts the supplied MCPX/BIOS/HDD paths, starts
i386 guest execution through AArch64 TCG, and initializes Xemu's NV2A Vulkan
renderer plus the M4 Android Vulkan presenter. The firmware does not initialize
an NV2A scanout surface on the Retroid, so no Xbox frame or boot checkpoint has
been demonstrated. The diagnostic now rejects QEMU's placeholder console
surface instead of presenting it as Xbox output.

## Baseline and boundaries

- BoxDroid base: M4 commit `54dd29e5a00bbfc8a41baacdad9e4c2d56d5f3f6`.
- Xemu source: official `https://github.com/xemu-project/xemu.git`, pinned at
  `478b4f496102379c7eaa7f3ec10e714a703c4300`.
- Android target: `arm64-v8a`, `aarch64-linux-android`, API 33, Bionic.
- NDK: `30.0.16248370`; Clang/LLD 21.0.0.
- Ordered downstream patches: M2, M3, M4, then
  `0004-m5-android-xbox-headless-core.patch`.

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

The clean scripted run logged Android surface creation at 01:12:09.918, Xbox
start at 01:12:09.950 and QEMU initialization return at 01:12:10.658. NV2A
Vulkan initialization completed its logged stages by 01:12:10.608. During the
45-second observation the local QEMU `exec` trace recorded two CPU reset events
and 487,113 executed translation-block entries. It records guest PCs and host
translation-block addresses without instruction-byte disassembly. This
demonstrates guest execution from the Xbox reset path under TCG; it does not
demonstrate firmware boot completion.

After a 45-second observation, the captured display was black. The NV2A path
reported that no scanout surface existed; therefore there were zero confirmed
NV2A readbacks and zero frames presented from Xbox output. An earlier
diagnostic version forwarded QEMU's “Guest has not initialized the display
(yet)” fallback surface; that was identified as non-Xbox output and excluded
from the result. No dashboard, boot animation or equivalent checkpoint was
reached. The HDD path was supplied as a QCOW2 IDE disk and QEMU initialization
accepted the device configuration, but guest IDE reads have not yet been
confirmed independently. All three device-side image SHA-256 values matched
their local inputs. The captured Android crash buffer contained no records;
the diagnostic was force-stopped after collecting output.

When the Activity is closed, `qemu_main_loop()` returns with status 0, but
`qemu_cleanup()` stalls in `vm_shutdown()` while waiting for the Xbox vCPU
threads to pause. `tcg,thread=single` was tested and did not remove that stall.
The diagnostic process was force-stopped after collecting evidence. This is an
unresolved Android embedded-runtime lifecycle issue; it is not reported as a
clean QEMU shutdown. No M5 crash was observed in the captured crash buffer.

## Verified and outstanding

| M5 item | Current result |
| --- | --- |
| Android `libboxdroid.so` load and Xbox machine initialization | Verified |
| MCPX/BIOS paths and sizes; image copies hash-verified on device | Verified |
| Xbox x86 reset path enters AArch64-hosted TCG | Verified by CPU reset and executed-TB trace records |
| QCOW2 path accepted in IDE drive configuration | Verified at QEMU initialization; guest reads not confirmed |
| NV2A Vulkan renderer initialization | Verified |
| Real NV2A scanout/readback | Not observed |
| Android Vulkan presentation of Xbox-produced output | Not observed |
| Visible Xbox boot checkpoint | Not reached |
| Clean embedded QEMU shutdown | Blocked in `vm_shutdown()` |
| Repeated boot to checkpoint | Not applicable until a checkpoint is reached |

M3/M4 regressions must be run from a fresh build root after changing the patch
series. M5 is not accepted until real guest-produced NV2A frames are presented
and a genuine boot checkpoint is visible on the Retroid.
