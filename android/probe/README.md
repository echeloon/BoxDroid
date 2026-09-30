# BoxDroid M0 Android capability probe

Standalone `arm64-v8a` diagnostic APK for the Retroid Pocket 5. It inventories Vulkan, creates and presents a Vulkan clear-color frame through `ANativeWindow`, exercises surface/swapchain recreation, and checks QEMU TCG-relevant executable-memory mappings with a locally assembled AArch64 `movz; ret` stub. It contains no emulator code.

## Pinned build tools

- JDK 17 (tested with Homebrew OpenJDK 17.0.20.1)
- Android Gradle Plugin 8.13.2 and Gradle 8.13 (Gradle wrapper)
- Android SDK platform/build tools 36 / 36.0.0
- Android NDK r30, package revision `30.0.16248370`
- CMake 3.31.6
- ABI `arm64-v8a`, `minSdk 26`, `targetSdk 36`

Set `JAVA_HOME`, `ANDROID_HOME`, and `ANDROID_SDK_ROOT` for the local SDK, accept the Android SDK licenses, and install the pinned packages listed above. Build from this directory with:

```sh
./gradlew --no-daemon :app:assembleDebug
```

The APK is `app/build/outputs/apk/debug/app-debug.apk`. Install, launch, and retrieve the report with:

```sh
adb install -r app/build/outputs/apk/debug/app-debug.apk
adb shell am force-stop org.boxdroid.m0probe
adb shell monkey -p org.boxdroid.m0probe 1
adb logcat -s BoxDroidM0
adb pull /sdcard/Android/data/org.boxdroid.m0probe/files/m0-report.json ./m0-report.json
```

To exercise an Activity recreation while the process stays alive, use `adb shell cmd uimode night yes` followed by `adb shell cmd uimode night no`, or rotate the device. Surface destruction/recreation is logged and each probe run rewrites the same report in app-specific external storage.

## Reading results

`m0-report.json` records device, Android, CPU, page size, all advertised instance/device extensions, queue families, selected physical-device properties, memory types/heaps, key limits, current Xemu texture/depth/vertex format features, detailed Vulkan capability checks, presentation steps, and executable-memory attempts. Format records retain raw Vulkan flags and include per-usage checks; unrelated feature bits do not count as passing a texture, vertex, color-attachment, or depth-attachment check. Each check uses `PASS`, `FAIL`, `UNKNOWN`, or `NOT_APPLICABLE`. `driver_version` is also retained as the raw Vulkan integer because its decoding is vendor-specific; `driver_name` and `driver_info` are included when Vulkan driver-properties are available.

The app writes only under its app-specific external-files directory. No storage permission is requested.

## Current upstream Xemu requirements represented by this probe

See [the explicit compatibility matrix](../../docs/m0/vulkan-requirements.md). The source baseline used when implementing this probe is current official Xemu `master`; pin and recheck the exact revision before starting Android cross-compilation.
