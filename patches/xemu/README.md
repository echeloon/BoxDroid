# Xemu downstream patch series

The current baseline is the official Xemu submodule at `478b4f496102379c7eaa7f3ec10e714a703c4300` (see [the M1 baseline record](../../docs/m1/xemu-baseline.md)). The downstream delta is recorded in [`series`](series), with the Android cross-build documented in [M2](../../docs/m2/android-arm64-cross-build.md) and the generic headless runtime target documented in [M3](../../docs/m3/headless-runtime.md).

Keep Xemu/QEMU changes as small, reviewable Git-format patches in this directory, ordered in `series`. Each patch should state its upstream status and why it cannot be handled in the Android platform layer. Patch 0001 enables the M2 Android cross-build; patch 0002 adds the Android AArch64 generic headless runtime target and its entry/build seams; patch 0003 adds an opt-in Meson source/dependency seam for the Android Vulkan presenter linked into the existing BoxDroid shared library. Android WSI implementation remains in `native/android/m4`, outside Xemu/QEMU core. These patches have not been upstreamed. Prefer upstreaming generic abstractions. Rebase the series against an explicitly selected official commit and update the `upstream/xemu` gitlink only after the desktop baseline builds again.

For a fresh checkout, initialize the official Xemu submodule and use the reproducible M2 script, which creates a detached source worktree and applies the patch series:

```sh
git submodule update --init upstream/xemu
ANDROID_NDK_HOME=/path/to/android-ndk-r30.0.16248370 scripts/m2-android-arm64.sh
```

The script intentionally does not recursively initialize Xemu's unrelated firmware/ROM submodules.

The M2 Android build procedure and validation results are documented in [`docs/m2/android-arm64-cross-build.md`](../../docs/m2/android-arm64-cross-build.md). M3's shared library, test guest, runtime behavior, and reproducible device commands are recorded in [`docs/m3/headless-runtime.md`](../../docs/m3/headless-runtime.md).

Do not copy or vendor the Xemu source tree here. The official source remains in the `upstream/xemu` submodule; this directory is reserved for the BoxDroid-specific delta.
