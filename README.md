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
1. A supported host: **macOS** (Intel or Apple Silicon), **Linux x86_64**, or **Windows via WSL2** (as a Linux x86_64 host). The Android NDK provides no Linux ARM64 host toolchain.
2. **Android NDK** 30.0.16248370 (the version pinned by the Gradle build).
3. **Android SDK / Platform Tools** (for Gradle and ADB deployment).
4. **JDK 17** (for Gradle).
5. **Node.js & npm** (for building the React web frontend).
6. Host build tools: `git`, `python3` (with `venv`), `ninja`, `cmake`, `pkg-config`, `rustup`, `file`, and a C compiler (Xcode Command Line Tools on macOS, `cc` on Linux).

The build scripts read these environment variables:

| Variable | Purpose | Default when unset |
| --- | --- | --- |
| `ANDROID_HOME` / `ANDROID_SDK_ROOT` | Android SDK location | `~/Library/Android/sdk` (macOS), `~/Android/Sdk` (Linux) |
| `ANDROID_NDK_HOME` | Android NDK location | `$ANDROID_HOME/ndk/30.0.16248370` |
| `JAVA_HOME` | JDK used by Gradle | the `java` found on `PATH` |
| `ANDROID_SERIAL` | Device used by `adb` when several are connected | the only connected device |

The resulting APK targets **Android 13 (API 33) or newer** on **`arm64-v8a`** devices.

## How to Build and Run

BoxDroid uses a unified script that handles syncing submodules, applying patches, building the native libraries via Meson/Ninja, compiling the React web frontend via Vite, packaging the APK with Gradle, and automatically deploying it to a connected device.

1. Connect an Android 13+ arm64 device via USB and ensure ADB debugging is authorized (`adb devices`).
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
