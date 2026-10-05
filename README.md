# BoxDroid
A new, lightweight Xbox emulator for Android

The pinned official Xemu baseline, downstream patch policy, and reproducible macOS build/launch procedure are documented in [docs/m1/xemu-baseline.md](docs/m1/xemu-baseline.md).

The M3 headless Android runtime diagnostic, including its clean-build and Retroid test procedure, is documented in [docs/m3/headless-runtime.md](docs/m3/headless-runtime.md). It exercises an AArch64 guest through QEMU TCG; it is not an Xbox boot path or product frontend.

The M4 Android Vulkan surface/swapchain diagnostic and Retroid lifecycle results are documented in [docs/m4/android-vulkan-presentation.md](docs/m4/android-vulkan-presentation.md). It presents controlled Vulkan clear frames through Android WSI and does not yet connect NV2A output.


README CHANGE TEST