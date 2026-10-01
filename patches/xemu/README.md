# Xemu downstream patch series

The current baseline is the official Xemu submodule at `478b4f496102379c7eaa7f3ec10e714a703c4300` (see [the M1 baseline record](../../docs/m1/xemu-baseline.md)). The M2 Android cross-build delta is recorded in [`series`](series) and summarized in [the M2 build report](../../docs/m2/android-arm64-cross-build.md).

Keep Xemu/QEMU changes as small, reviewable Git-format patches in this directory, ordered in `series`. Each patch should state its upstream status and why it cannot be handled in the Android platform layer. The current M2 patch is a single consolidated build-enablement patch; it has not been upstreamed. Prefer upstreaming generic abstractions. Rebase the series against an explicitly selected official commit and update the `upstream/xemu` gitlink only after the desktop baseline builds again.

For a fresh checkout, initialize the official Xemu submodule and use the reproducible M2 script, which creates a detached source worktree and applies the patch series:

```sh
git submodule update --init upstream/xemu
ANDROID_NDK_HOME=/path/to/android-ndk-r30.0.16248370 scripts/m2-android-arm64.sh
```

The script intentionally does not recursively initialize Xemu's unrelated firmware/ROM submodules.

The M2 Android build procedure, validation results, and remaining link boundary are documented in [`docs/m2/android-arm64-cross-build.md`](../../docs/m2/android-arm64-cross-build.md).

Do not copy or vendor the Xemu source tree here. The official source remains in the `upstream/xemu` submodule; this directory is reserved for the BoxDroid-specific delta.
