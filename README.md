# BoxDroid

A lightweight Xbox emulator for Android, built on top of [Xemu](https://xemu.app/).

BoxDroid bridges Xemu's core emulation engines (QEMU, NV2A, APU) into a seamless Android application, taking advantage of Android's native toolchain (AArch64), Vulkan graphics rendering, and native audio/controller inputs. The user interface is driven by a React-based web frontend running within a local Android WebView.

## Repository Structure

- `android/` - The Android frontend application (UI, Activities, and JNI bridges).
- `web-frontend/` - The React SPA that powers the emulator's user interface via WebView.
- `native/android/core/` - The core native BoxDroid library code (JNI entrypoints, Vulkan surface handling, audio/input callbacks).
- `upstream/xemu/` - The official upstream Xemu submodule.
- `patches/xemu/` - Our custom patch series applied to the Xemu baseline to make it compatible with Android and BoxDroid's frontend.
- `scripts/` - Automation and build scripts.

## Prerequisites

To build BoxDroid locally, you will need:
1. **macOS** build environment (the current cross-build script uses the macOS NDK toolchain).
2. **Android NDK** (version r30.0.16248370 recommended).
3. **Android SDK / Platform Tools** (for ADB deployment).
4. **Java Development Kit (JDK)** (for Gradle).
5. **Node.js & npm** (for building the React web frontend).

Make sure the `ANDROID_NDK_HOME` environment variable is set or the NDK is located in the standard Android SDK path.

## How to Build and Run

BoxDroid uses a unified script that handles syncing submodules, applying patches, building the native libraries via Meson/Ninja, compiling the React web frontend via Vite, packaging the APK with Gradle, and automatically deploying it to a connected device.

1. Connect your Android device (e.g., Retroid) via USB and ensure ADB debugging is authorized (`adb devices`).
2. Run the build script:
   ```bash
   ./scripts/build-android.sh
   ```
3. The script will automatically:
   - Prepare a detached source worktree from the pinned `upstream/xemu` baseline and apply the downstream patch series.
   - Build the `libboxdroid.so` shared library.
   - Run `npm ci` if dependencies are absent and build the React SPA in `web-frontend/`.
   - Package the `org.boxdroid` APK (including the web assets).
   - Install the APK on your device.
   - Launch the frontend activity.

Set `BOXDROID_INSTALL=0` to build without installing. Native libraries are
rebuilt incrementally and repackaged on every invocation. For device logs, run
`adb logcat -s BoxDroid BoxDroid3 BoxDroidAudio` separately.

The [Snapdragon 865 performance report](docs/performance/snapdragon-865.md)
describes opt-in profiling, measured worker comparisons and ordering guarantees.

## Game Preparation
Once the emulator launches, use the "Settings" menu in the web interface to configure your BIOS, MCPX, and HDD images. Then go to "Play Games" to select your legally dumped Xbox `.iso` / `.xiso` game files. 

## Development Notes
- The Android WSI (Window System Integration) and Vulkan presenter are tightly coupled with Xemu's internal rendering pipeline. Any changes to the display should be verified against `native/android/core/boxdroid-vulkan-presenter.cpp`.
- If modifying the native core, the build script will do incremental builds by default. To do a clean build, simply remove the `build/` directory before running the script.
- If modifying the React frontend (`web-frontend/`), the script will rebuild it automatically.
