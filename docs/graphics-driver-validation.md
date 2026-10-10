# BoxDroid custom Vulkan drivers — implementation and device validation

Validated on 2026-10-10 using Retroid Pocket 5, Android 13/API 33, ADB serial `20537a44`.
All implementation changes are uncommitted on `vulkan-turnip`.

Evidence is retained locally in `build/validation/vulkan-turnip/` (ignored build artifacts).
The [condensed driver proof](../build/validation/vulkan-turnip/driver-proof.txt) contains the loader and physical-device records.

1. **Starting Git state.** Clean working tree and index on `vulkan-turnip`, HEAD `791b08c`. Both `git diff` and `git diff --cached` were empty. `main`, `origin/main`, and `origin/HEAD` also pointed at `791b08c`; `origin/main...HEAD` was `0 0`. Recent commits included `791b08c`, `a68f838`, `bbe5c17`, `511d57c`, `0c68eb3`, `85ed882`, `411c177`, and `5410dee`. These are the observed local refs; the remote was not changed.

2. **Branch discipline.** Stayed on `vulkan-turnip`. No additional branch, commit, push, merge, reset, or discard of unrelated work. The pinned Xemu source is integrated through the existing downstream patch workflow; its upstream submodule was not edited.

3. **Existing architecture.** React Router pages share `matrix-layout.tsx` and the current animated background. Settings used `SelectionListItem`, with a main row button and a separate Lucide trash action. `FrontendActivity` serves built assets in a WebView at `http://boxdroid.local`, exposes `BoxDroidBridge`, and publishes `settings_changed` events. Existing system-file URIs and the game library remain in `boxdroid_games` SharedPreferences with persistable SAF grants. Controller up/down skips row actions; left/right reaches them; A activates. Existing B handling relied on WebView history and could exit the SPA; it now activates the page's visible Back link. The original system-file callbacks are reused.

4. **Files.** The complete modified/created source inventory is listed below. The native dependency is vendored source with retained BSD licenses and pinned revision information, not a downloaded GPU driver. `matrix-layout.tsx` only loses a duplicate, unused import; its existing local rain implementation is retained.

5. **Settings hierarchy.** `Settings → Load System Files → MCPX Image / BIOS Image / HDD Image`, and `Settings → Performance & Graphics → Graphics Driver → System Driver / installed Custom Driver / Load Driver`. Every page uses the existing header and row geometry. No CSS, font, menu theme, background, or focus appearance was redesigned. The custom trash glyph uses the existing danger palette.

6. **Supported package format.** Established Android custom-driver ZIP schema 1: flat `meta.json` plus one or more `.so` files, with `libraryName` naming the Vulkan HAL library. One installed package is supported. Other layouts, ZIP64, and metadata schemas are explicitly rejected. Package name/version/GPU model are not special-cased.

7. **Actual package.** Discovered `/sdcard/Download/Turnip_v26.2.0_R5_patched-SD865.zip` through ADB. Compressed ZIP: 2,532,694 bytes. Exactly two root entries: `libvulkan_freedreno.so` (14,414,728 bytes) and `meta.json` (293 bytes). Metadata: schema `1`, name `Turnip v26.2.0-R5_kgsl`, description `mesa main + kgsl patch for timeline semaphores`, author `stevenmx`, packageVersion `1`, vendor `Mesa`, driverVersion `Vulkan 1.4.352`, minApi `28`, libraryName `libvulkan_freedreno.so`. ELF: little-endian ELF64, ET_DYN, AArch64. DT_NEEDED: `libhardware.so`, `liblog.so`, `libnativewindow.so`, `libsync.so`, `libm.so`, `libz.so`, `libdl.so`, `libc.so`. See [package inventory](../build/validation/vulkan-turnip/package-inspection.txt).

8. **ZIP security and validation.** Selected content is read through SAF, bounded, and copied to a temporary private archive. Central and local ZIP headers are checked. Absolute paths, separators, `..`, special filenames, directories, symlinks/special Unix modes, encrypted/multipart ZIPs, duplicate names including case collisions, conflicting local names, bad checksums, unsupported layouts, missing metadata/libraries, and incompatible ELF headers are rejected. Limits: 32 MiB archive, 32 entries, 16 KiB metadata, 64 MiB per library, 128 MiB expanded total, and a 1000:1 per-entry ratio. Files are streamed with actual byte bounds and CRC checks. Native loading/instance/device creation in a separate process confirms dependencies and usable Vulkan entry points. A file identity check against `/proc/self/maps` rejects silent system fallback. Selection changes only after successful validation. Failed imports delete staging and preserve the existing installation.

9. **Private storage.** `/data/user/0/org.boxdroid/files/graphics-drivers/custom/` holds extracted runtime files. `/data/data/...` is the kernel mapping alias on this device. Extraction never writes outside its fresh `staging-<uuid>` directory. The temporary ZIP is removed; the original SAF URI is not used at runtime. Runtime library files are owner-readable and read-only after extraction. Replacement uses a recoverable `previous` directory and removes it after success.

10. **Persistence.** `graphics-drivers/state.json` is written with Android `AtomicFile`, protected by an OS file lock plus a process-local lock. It stores SYSTEM/CUSTOM, installation id, validated metadata, display name, and any error. `state.lock` is coordination state, not an extracted driver file. Reads in the frontend and emulator are fresh across processes. A `custom-starting` marker detects interrupted initialization. Navigation, activity recreation/process recreation, app reinstall with data retained, and a real device reboot preserved installation/selection. Stale staging/import files and interrupted replacements are recovered on frontend creation.

11. **Native mechanism.** The vendored `libadrenotools` creates an isolated copy of Android's Vulkan loader and redirects its HAL load to the app-private library. A small BoxDroid support library supplies its `vkGetInstanceProcAddr`. The presenter uses it in its own dispatch table; Xemu uses `volkInitializeCustom` with the same entry point. Both consumers log their actual physical-device properties. SYSTEM keeps the presenter's normal `dlopen("libvulkan.so")` and Xemu's existing `volkInitialize()` path.

12. **Why this is appropriate for Android.** Android Vulkan HAL loading and Android surface integration require the Android loader and its linker namespaces. A direct driver `dlopen` does not cover the existing two-instance architecture and Android WSI. [libadrenotools' implementation](https://github.com/bylaws/libadrenotools/blob/8fae8ce254dfc1344527e05301e43f37dea2df80/src/driver.cpp) establishes app-local namespaces; its [API contract](https://github.com/bylaws/libadrenotools/blob/8fae8ce254dfc1344527e05301e43f37dea2df80/include/adrenotools/driver.h) requires private driver storage and extracted APK native libraries. `useLegacyPackaging=true` supplies the hook directory from `ApplicationInfo.nativeLibraryDir`. No root, system/vendor replacement, global driver property, or global Vulkan override is used.

13. **Selection point.** `MainActivity`'s native executor reads driver state and configures CUSTOM immediately before `nativeSurfaceCreated`. This precedes the presenter instance and Xemu instance/device. `libboxdroid.so` may already be loaded by the activity's static initializer; the custom loader remains isolated from any previously mapped system loader. The frontend does not load the emulator or imported native code.

14. **Restart boundary.** Changes apply to the next game launch in a fresh `:emulator` process. The existing GameActivity already terminates this process on destruction because Xemu is not reentrant. A whole app or device restart is unnecessary. No hot switching is claimed; an existing game keeps its current Vulkan resources.

15. **SYSTEM behavior.** Default selection, no custom support library loading, no custom namespace or driver override. The observed post-deletion maps contain `/system/lib64/libvulkan.so` and `/vendor/lib64/hw/vulkan.adreno.so`, and contain no imported driver/support hook mappings.

16. **CUSTOM behavior.** Import is validated in `:drivercheck`, which exits after each probe. A successful probe creates a real Vulkan instance/device, confirms the private library's inode/device identity is mapped, and installs/selects the package. A fresh game process uses the same loading mechanism for the presenter and Xemu renderer.

17. **Failure behavior.** Archive/ELF/native validation failures preserve the existing installation and selection, clean staging, log the error, and show it in Load Driver's subtitle. A custom loader failure before either renderer instance is safely followed by the original SYSTEM path and persisted SYSTEM. A failed custom surface/runtime initialization ends the game and selects SYSTEM for the next launch. Interrupted initialization is recovered on return/reopen without automatic game relaunch. Simulated startup interruption and a temporary non-Vulkan library at the selected runtime path were tested: both persisted SYSTEM; the latter continued with Qualcomm in both consumers. The original imported library was restored before deletion. See [fallback evidence](../build/validation/vulkan-turnip/failure-fallback.log).

18. **SYSTEM proof before import.** Both `presenter` and `xemu-renderer` logged `mode=SYSTEM`, `device=Adreno (TM) 650`, `driverName=Qualcomm Technologies Inc. Adreno Vulkan Driver`, `driverID=8`, vendor `0x5143`, device `0x6050002`, driverVersion `2150539264`, API `4198528`. Qualcomm build info included `c095b0f6a5`, `I88dcacb6b9`, and date `09/27/23`. See [initial system log](../build/validation/vulkan-turnip/system-before.log).

19. **Turnip proof.** Both consumers logged `mode=CUSTOM`, `device=Turnip Adreno (TM) 650`, `driverName=Turnip`, `driverID=18`, vendor `0x5143`, device `0x6050002`, driverVersion `109056099`, API `4206944`. The matching private library mapping is also recorded. Turnip returned an empty `driverInfo`; nothing is invented for that field. See [final APK core proof](../build/validation/vulkan-turnip/turnip-final-core.log).

20. **Import result.** Passed the actual frontend/controller route `Settings → Performance & Graphics → Graphics Driver → Load Driver`, opened `ACTION_OPEN_DOCUMENT`, navigated to Download, selected the existing Turnip ZIP through the picker, validated it natively, installed it privately, and selected CUSTOM. The flow was repeated to validate replacement/recovery. No driver was manually installed as a substitute for this test and no other driver was downloaded. See [SAF screenshot](../build/validation/vulkan-turnip/saf-turnip.png) and [import log](../build/validation/vulkan-turnip/turnip-import.log).

21. **Game test.** Sega GT 2002 booted through logos and menus into an actual race with Turnip. Captures show track, cars, mirror, HUD and pause behavior, with no obvious corruption or immediate device-loss error in the captured run. AAudio stayed RUNNING, error=0, with nonzero offered/consumed samples. Actual Retroid controller-device input reached guest slot 0; Start paused the race. This was functional validation, not a benchmark. See [race](../build/validation/vulkan-turnip/turnip-race.png), [controller pause](../build/validation/vulkan-turnip/turnip-controller-pause.png), and [game log](../build/validation/vulkan-turnip/turnip-game.log).

22. **Deletion.** Navigated to the installed custom row, moved right onto `Delete custom graphics driver`, and activated it through the Retroid's controller input device. The red trash action was visibly focused. The UI immediately showed System Driver Active, state became exactly `{"mode":"SYSTEM"}`, and `custom/`, extracted libraries, package metadata, and startup marker were gone. Only `state.json` and `state.lock` remained. The original Download ZIP was retained. See [focused trash](../build/validation/vulkan-turnip/controller-trash.png) and [system state](../build/validation/vulkan-turnip/system-active-after-delete.png).

23. **Rollback proof.** Next Sega GT 2002 launch logged `LOADER_SELECTED mode=SYSTEM override=none` and Qualcomm driver ID 8 in both consumers, in fresh emulator PID 8053. Its maps confirm the system and vendor Vulkan libraries and no custom support/driver hooks. See [rollback log](../build/validation/vulkan-turnip/system-after-delete.log), [process maps](../build/validation/vulkan-turnip/system-after-delete-maps.txt), and [game startup results](../build/validation/vulkan-turnip/final-game-startup.log).

24. **Invalid ZIP tests.** Traversal entry `../boxdroid-outside-test` was rejected, no outside file appeared, CUSTOM remained selected, and no staging/temporary archive remained. Invalid ELF/ABI was rejected before native code. A valid ARM64 shared object lacking `HMI` was rejected by the isolated native probe with `Custom driver exposes no Vulkan physical devices`; the frontend survived and the installed Turnip remained selected. The traversal test was repeated against the final APK, with the error visible inside the existing row. Temporary ZIPs and runtime fault artifacts were removed from the device. See [invalid logs](../build/validation/vulkan-turnip/invalid-packages.log) and [final alert](../build/validation/vulkan-turnip/invalid-alert.png).

25. **Controller navigation.** Verified up/down, left/right action focus, A selection, B parent navigation, System/Custom mode switching, Load Driver activation, and deletion. Used ADB key injection and `sendevent` on the Retroid's real `Xbox Wireless Controller` input device (`/dev/input/event8`, Android device id 8), without root. DOM inspection was used to confirm routes and focused button labels; driver import and deletion were performed through visible UI actions. The same semantic buttons support touch and mouse; touch was used in the Android picker.

26. **System-file regression.** Entered Load System Files by controller, verified all three existing names, reached the existing clear action by right navigation without changing it, and reselected the original MCPX, BIOS, and HDD through their SAF pickers. The complete `boxdroid_games` preference XML matched the pre-test snapshot afterward, including unchanged URI references and game library. Games still booted with those selections. B returned to Settings.

27. **Limits.** Validated one real package and one device; other hardware/package combinations still need device testing. CUSTOM requires compatible arm64 Android Vulkan HAL packages and API >=28; the underlying app-local mechanism is supplied by libadrenotools. The ZIP format is intentionally limited to schema-1 flat metadata/library packages. Package metadata says Vulkan 1.4.352; this Android 13 runtime exposes API 1.3.352 (4206944), so metadata is not a runtime capability guarantee. Native driverVersion is reported verbatim; its standard version decomposition is 26.1.99, while the package labels itself v26.2.0-R5_kgsl. Audio validation confirms the engine and nonzero sample delivery, not a separate acoustic recording; emulation-related underruns were present. No performance conclusions are drawn. Native code runs with app permissions; the probe isolates validation crashes, not hostile native code privileges. Upstream dependency/build deprecation warnings remain; the BoxDroid loader compiled successfully. All required functional flows passed.

28. **Final Git/device state.** Still `vulkan-turnip` at `791b08c`, unchanged refs and empty index. The modified source files and new files below are uncommitted. Device has the final debug APK, selected SYSTEM, no installed custom driver, and the original Turnip ZIP in Download. No commit/push/merge was performed. Build, device tests, and `git diff --check` passed.

## Modified and created source files

- `android/app/build.gradle`
- `android/app/src/main/AndroidManifest.xml`
- `android/app/src/main/java/org/boxdroid/FrontendActivity.java`
- `android/app/src/main/java/org/boxdroid/GraphicsDriverProbe.java`
- `android/app/src/main/java/org/boxdroid/GraphicsDriverStore.java`
- `android/app/src/main/java/org/boxdroid/MainActivity.java`
- `docs/graphics-driver-validation.md`
- `native/android/core/boxdroid-vulkan-presenter.cpp`
- `native/android/core/boxdroid.map`
- `native/android/driver/CMakeLists.txt`
- `native/android/driver/UPSTREAM.md`
- `native/android/driver/libadrenotools/CMakeLists.txt`
- `native/android/driver/libadrenotools/LICENSE`
- `native/android/driver/libadrenotools/README.md`
- `native/android/driver/libadrenotools/adrenotools.pc.in`
- `native/android/driver/libadrenotools/build_asm.sh`
- `native/android/driver/libadrenotools/gen/bcenabler_patch.h`
- `native/android/driver/libadrenotools/include/adrenotools/bcenabler.h`
- `native/android/driver/libadrenotools/include/adrenotools/driver.h`
- `native/android/driver/libadrenotools/include/adrenotools/priv.h`
- `native/android/driver/libadrenotools/lib/linkernsbypass/CMakeLists.txt`
- `native/android/driver/libadrenotools/lib/linkernsbypass/LICENSE`
- `native/android/driver/libadrenotools/lib/linkernsbypass/README.md`
- `native/android/driver/libadrenotools/lib/linkernsbypass/android_linker_ns.cpp`
- `native/android/driver/libadrenotools/lib/linkernsbypass/android_linker_ns.h`
- `native/android/driver/libadrenotools/lib/linkernsbypass/elf_soname_patcher.cpp`
- `native/android/driver/libadrenotools/lib/linkernsbypass/elf_soname_patcher.h`
- `native/android/driver/libadrenotools/src/bcenabler.cpp`
- `native/android/driver/libadrenotools/src/bcenabler_patch.s`
- `native/android/driver/libadrenotools/src/driver.cpp`
- `native/android/driver/libadrenotools/src/hook/CMakeLists.txt`
- `native/android/driver/libadrenotools/src/hook/file_redirect_hook.c`
- `native/android/driver/libadrenotools/src/hook/gsl_alloc_hook.c`
- `native/android/driver/libadrenotools/src/hook/hook_impl.cpp`
- `native/android/driver/libadrenotools/src/hook/hook_impl.h`
- `native/android/driver/libadrenotools/src/hook/hook_impl_params.h`
- `native/android/driver/libadrenotools/src/hook/kgsl.h`
- `native/android/driver/libadrenotools/src/hook/main_hook.c`
- `native/android/driver/libadrenotools/tools/ADPKG.md`
- `native/android/driver/libadrenotools/tools/README.md`
- `native/android/driver/libadrenotools/tools/acc-shim/README.md`
- `native/android/driver/libadrenotools/tools/acc-shim/vk_acc_shim.cpp`
- `native/android/driver/libadrenotools/tools/blob-patcher.py`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/.clang-format`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/Android.bp`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/README.md`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/QtiGrallocDefs.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/common.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_adreno_info.cpp`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_adreno_info.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_priv_handle.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_utils.cpp`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_utils.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gralloc_priv.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/mapper.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/mapperextensions.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/types/common.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/types/mapper.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/ext/types/mapperextensions.h`
- `native/android/driver/libadrenotools/tools/qtimapper-shim/shim.cpp`
- `native/android/driver/loader.cpp`
- `patches/xemu/0035-android-custom-vulkan-driver.patch`
- `patches/xemu/series`
- `scripts/build-android.sh`
- `web-frontend/app/routes.ts`
- `web-frontend/app/routes/matrix-layout.tsx`
- `web-frontend/app/routes/settings.tsx`
- `web-frontend/app/types.d.ts`

## Final status snapshot

```text
## vulkan-turnip
 M android/app/build.gradle
 M android/app/src/main/AndroidManifest.xml
 M android/app/src/main/java/org/boxdroid/FrontendActivity.java
 M android/app/src/main/java/org/boxdroid/MainActivity.java
 M native/android/core/boxdroid-vulkan-presenter.cpp
 M native/android/core/boxdroid.map
 M patches/xemu/series
 M scripts/build-android.sh
 M web-frontend/app/routes.ts
 M web-frontend/app/routes/matrix-layout.tsx
 M web-frontend/app/routes/settings.tsx
 M web-frontend/app/types.d.ts
?? android/app/src/main/java/org/boxdroid/GraphicsDriverProbe.java
?? android/app/src/main/java/org/boxdroid/GraphicsDriverStore.java
?? docs/graphics-driver-validation.md
?? native/android/driver/
?? patches/xemu/0035-android-custom-vulkan-driver.patch
```
