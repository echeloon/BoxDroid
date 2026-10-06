# Xemu downstream patch series

The current baseline is the official Xemu submodule at `478b4f496102379c7eaa7f3ec10e714a703c4300` (see [the  baseline record](../../docs/core/xemu-baseline.md)). The downstream delta is recorded in [`series`](series), with the Android cross-build documented in [](../../docs/core/android-arcore4-cross-build.md) and the generic headless runtime target documented in [](../../docs/core/headless-runtime.md).

Keep Xemu/QEMU changes as small, reviewable Git-format patches in this directory, ordered in `series`. Each patch should state its upstream status and why it cannot be handled in the Android platform layer. Patch 0001 enables the  Android cross-build; patch 0002 adds the Android AArch64 generic headless runtime target and its entry/build seams; patch 0003 adds an opt-in Meson source/dependency seam for the Android Vulkan presenter linked into the existing BoxDroid shared library. Android WSI implementation remains in `native/android/core`, outside Xemu/QEMU core. These patches have not been upstreamed. Prefer upstreaming generic abstractions. Rebase the series against an explicitly selected official commit and update the `upstream/xemu` gitlink only after the desktop baseline builds again.

For a fresh checkout, initialize the official Xemu submodule and use the reproducible  script, which creates a detached source worktree and applies the patch series:

```sh
git submodule update --init upstream/xemu
ANDROID_NDK_HOME=/path/to/android-ndk-r30.0.16248370 scripts/build-android.sh
```

The script intentionally does not recursively initialize Xemu's unrelated firmware/ROM submodules.

The  Android build procedure and validation results are documented in [`docs/core/android-arcore4-cross-build.md`](../../docs/core/android-arcore4-cross-build.md). 's shared library, test guest, runtime behavior, and reproducible device commands are recorded in [`docs/core/headless-runtime.md`](../../docs/core/headless-runtime.md).

Do not copy or vendor the Xemu source tree here. The official source remains in the `upstream/xemu` submodule; this directory is reserved for the BoxDroid-specific delta.
