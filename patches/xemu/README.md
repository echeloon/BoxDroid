# Xemu downstream patch series

The current baseline is the official Xemu submodule at `478b4f496102379c7eaa7f3ec10e714a703c4300` (see [the M1 baseline record](../../docs/m1/xemu-baseline.md)). There are no BoxDroid patches to Xemu at M1.

Keep future Xemu/QEMU changes as small, reviewable Git-format patches in this directory, with an ordered `series` file once the first patch exists. Each patch should state its upstream status and why it cannot be handled in the Android platform layer. Prefer upstreaming generic abstractions. Rebase the series against an explicitly selected official commit and update the `upstream/xemu` gitlink only after the desktop baseline builds again.

Do not copy or vendor the Xemu source tree here. The official source remains in the `upstream/xemu` submodule; this directory is reserved for the BoxDroid-specific delta.
