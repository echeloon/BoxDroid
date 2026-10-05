# M5: Android Xbox boot presentation

## Status

**PASS** — M5's genuine Xbox boot checkpoint was reproduced on two fresh
Retroid Pocket 5 launches. Both showed the green boot animation, Xbox logo,
and dashboard prompt, in landscape, with successful Vulkan presentation and
clean shutdown.

## Goal and boundaries

M5 proves that the official Xemu Xbox machine can execute the supplied boot
path on Android ARM64 and present genuine guest-produced Xbox visuals through
the Android Vulkan display path. It is a boot and presentation milestone; it
does not establish game compatibility, complete controller or audio support,
retail dashboard support, final 720p guest rendering, performance targets,
broad Android device compatibility, or production readiness.

The source baseline is the official
[`xemu-project/xemu`](https://github.com/xemu-project/xemu) repository, pinned
at `478b4f496102379c7eaa7f3ec10e714a703c4300`. The Android target is
`arm64-v8a` / `aarch64-linux-android`, API 33, Bionic, built with NDK
`30.0.16248370` and Clang/LLD 21.0.0. Downstream patches `0001` through `0014`
apply in order to that pinned source. The resulting `libboxdroid.so` is
ELF64/AArch64; the Android build introduces no desktop OpenGL or libpcap
dependency.

MCPX, BIOS, HDD, and matching EEPROM are user-provided files. The M5 script
stages the MCPX, BIOS, and HDD under app-scoped device storage, verifies their
device copies, and opens them locally on the Retroid. Firmware is not part of
the repository or APK.

## Final result and boot path

On the physical Retroid Pocket 5 (Android 13/API 33, Snapdragon 865, Adreno
650), both fresh launches showed this sequence:

1. Green Xbox boot animation.
2. Xbox logo.
3. HDD dashboard prompt: **“Please insert an Xbox disc...”**

The guest executes `C:\xboxdash.xbe` from the HDD. Its prompt is dashboard
output, not evidence of a failed HDD boot. Pre-dashboard visuals are rendered
by the NV2A Vulkan path. The existing VGA/direct-VRAM fallback continues to
present the dashboard. The 640×480 guest image remains 4:3 and aspect-fitted
on the Android presentation surface; the display is correctly oriented in
landscape. The prompt remained stable after it appeared.

## Root cause

The Vulkan renderer already produced the genuine animation and logo in the
NV2A render target at `0x32a4000`. Earlier probes sampled only the center of
the image, a mostly black region, and therefore mischaracterized the full
target. Bounded full-frame measurements found 0 nonblack pixels after draw 1,
306,241 after draw 64, and 32,050 after draws 128 and 200.

The Android/desktop divergence was recurring accelerated scanout acquisition.
M5 initially relied on QEMU CPU-VRAM dirty tracking through
`dpy_gfx_update()`. Vulkan rendering did not keep that CPU dirty bitmap active,
so after initial display updates the scanout downloads and Android presentation
stopped even while the Vulkan target continued to contain valid Xbox frames.
Desktop Xemu requests accelerated scanout independently from its render loop.

## Final fix

The existing M5 QEMU refresh callback now acquires and releases accelerated
scanout before calling `graphic_hw_update()`. The scanout download marks VGA
memory dirty, allowing the normal QEMU display callback, Pixman conversion,
and Android presenter to receive frames. While waiting for PFIFO/scanout work,
the callback temporarily releases the QEMU Big QEMU Lock (BQL), then reacquires
it. This avoids the demonstrated lock cycle in which scanout waited for PFIFO
while PFIFO notification/context interrupt delivery required the BQL.

No polling thread was added. No synthetic or prerecorded frames were used,
and no shader workaround or alternate framebuffer path was used for the boot
animation. The existing VGA/direct-VRAM dashboard fallback remains intact.

## Physical validation

Both runs were fresh Android processes on the Retroid. Counts are successful
acquire / submit / present operations.

| Result | Fresh launch 1 | Fresh launch 2 |
| --- | ---: | ---: |
| Process ID | 22670 | 23154 |
| Acquire / submit / present | 329 / 329 / 329 | 333 / 333 / 333 |
| Failed presents | 0 | 0 |
| Green boot animation visible | Yes | Yes |
| Xbox logo visible | Yes | Yes |
| Dashboard prompt visible | Yes | Yes |
| Clean shutdown | Yes | Yes |
| Crash-buffer size | 0 bytes | 0 bytes |

Captures at 25, 30, 35, and 40 seconds were byte-identical within each run,
confirming that the dashboard prompt remained stable after appearing. Android
presentation preserves the guest's 4:3 aspect ratio and landscape orientation.

## Regression checks

- A clean Android build from the pinned Xemu baseline and ordered patches
  `0001`–`0014` succeeded.
- `libboxdroid.so` was verified as ELF64/AArch64.
- M3 real TCG execution and clean shutdown passed before and after M4
  regression validation.
- M4 surface/presentation regression passed all five fresh launches, including
  the required surface recreation checks.
- No desktop OpenGL or libpcap dependency was introduced.

The M5 script still reports `PARTIAL_VISUAL_REVIEW_REQUIRED` after capturing
the run because it does not automatically certify the visual sequence. Manual
review of the two physical-device runs confirmed all three genuine boot
stages. That review resolves the previous status and satisfies M5's visual
checkpoint requirement.

## Diagnostic history

- Initial framebuffer sampling found 452 white pixels, which decoded as
  **“Please insert an Xbox disc...”**. Subsequent HDD inspection and guest
  execution evidence proved that `C:\xboxdash.xbe` was running.
- A bounded VGA/direct-VRAM bridge made the dashboard prompt visible on
  Android. Landscape presentation and swapchain stability were then validated.
- Desktop Xemu with the same inputs showed the green animation and Xbox logo.
  Android NV2A lookup found the active `0x32a4000` surface, while early
  center-only GPU probes misleadingly appeared black.
- Full-frame Vulkan measurements proved the genuine boot visuals were already
  in that target. The remaining blocker was the stopped recurring accelerated
  scanout acquisition; the refresh callback fix restored the full sequence.

## Reproduce the device run

On the supported macOS host, provide readable local firmware and HDD files.
The script validates the inputs, builds the pinned Xemu source plus the
ordered downstream patches, installs the diagnostic app, stages and verifies
device copies, launches the Xbox machine, and saves logs and visual evidence
under the ignored `build/m5/repro/results/` directory.

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

Set `ANDROID_SERIAL` if multiple ADB devices are connected. The script's
`PARTIAL_VISUAL_REVIEW_REQUIRED` result requires review of the captured visual
checkpoints; it is not an automatic rejection of the technically validated
boot result. The Android copies are staged under
`/sdcard/Android/data/org.boxdroid.m5/files/m5/`. Do not put firmware in the
repository, app assets, or release packages.

## M5 exit criteria

**PASS.** On the physical Retroid Pocket 5, the Xbox machine executed the
user-provided boot path, produced genuine pre-dashboard NV2A-rendered visuals,
and presented the green animation, Xbox logo, and dashboard prompt. The HDD
dashboard boot succeeded, Android presentation worked end to end, and the
prompt remained stable. Two fresh launches reproduced the sequence with zero
failed presents, clean shutdowns, and empty crash buffers.

The earlier `PARTIAL_VISUAL_REVIEW_REQUIRED` state is resolved by manual
visual review confirming the complete sequence across both fresh launches.

## Known limitations and next milestone

M5 PASS does not claim game compatibility; complete controller or audio
support; retail dashboard support; final 720p guest rendering; final
performance targets; broad Android device compatibility; or production
readiness. Those remain outside M5.

The next roadmap milestone is **M6**. It has not been started as part of this
M5 documentation update.
