# M2: Android ARM64 native cross-build

## Result

**PASS for the M2 acceptance criterion:** a reproducible configure/build path compiles the pinned Xemu/QEMU Android ARM64 core and its required target archives with desktop OpenGL and libpcap disabled. The build includes the NV2A Vulkan renderer/display translation units, QEMU TCG, QEMU POSIX utilities, and the Rust DSP56300 FFI crate. Representative outputs were verified as ELF64 AArch64 Android target objects.

M2 does **not** produce a runnable Android executable or `libboxdroid.so`. An earlier exploratory attempt to link `qemu-system-i386` exposed unresolved Xemu application/desktop integration symbols, including `main`, snapshot helpers, notifications, and pcap initialization. The archive-level M2 criterion does not require a frontend link; resolving that integration boundary belongs to a later milestone. No Android presenter or application integration was added here.

## Pinned inputs and target

- Official Xemu repository: `https://github.com/xemu-project/xemu.git`
- Xemu baseline: `478b4f496102379c7eaa7f3ec10e714a703c4300` (the existing `upstream/xemu` gitlink; unchanged).
- Android ABI/triple: `arm64-v8a` / `aarch64-linux-android`.
- Native API level: 33 (`aarch64-linux-android33-clang`), chosen to match the Android 13 test device while still being an explicit NDK native API choice. This is independent of Android compile/target SDK values.
- NDK: `30.0.16248370`, Clang and LLD 21.0.0.
- vcpkg repository: `https://github.com/microsoft/vcpkg.git`, commit `a42757564758c60651ebc616d9b000b7b91249ef`.
- DSP56300 source: official `https://github.com/mborgerson/dsp56300.git`, commit `bde7c233a447d32d558c48cb4438e1425fe0bbcc` (tag `v0.1.3`).

`patches/xemu/series` is the downstream source delta. The source worktree is created detached at the Xemu pin; patches are applied there, never directly in the `upstream/xemu` submodule. `native/android/vcpkg.json` pins dependency resolution to the vcpkg baseline. Android's DSP56300 archive is built from the pinned upstream crate source because the release archive URL used by Xemu is unavailable for Android.

## Host and target toolchains

Host-executed tools: macOS arm64 Xcode Command Line Tools Clang, Python, Meson, Ninja, CMake, pkg-config, vcpkg, Git, Cargo/Rust host tools, and Xemu's build-time generators. Target-produced code uses NDK Clang/LLD, NDK binutils, Android sysroot/Bionic and API 33; vcpkg and Cargo target outputs use Android ARM64. In particular, Meson is configured with separate host and build-machine compilers so generated tools run on macOS rather than accidentally trying to execute Android binaries.

Versions observed in the successful run:

| Tool | Version |
|---|---|
| macOS | Apple Silicon; Xcode Command Line Tools SDK selected via `xcrun` |
| Android NDK | `30.0.16248370` |
| NDK Clang / LLD | `21.0.0` / `21.0.0` |
| Python | `3.9.6` |
| Meson | `1.9.0` |
| Ninja | `1.13.2` |
| CMake | `4.4.3` |
| pkg-config | `3.0.7` |
| Rust target toolchain | `1.96.0-aarch64-apple-darwin`, with `aarch64-linux-android` std installed |
| vcpkg | commit `a42757564758c60651ebc616d9b000b7b91249ef` |

The script creates a per-work-root Python virtual environment and installs Meson 1.9.0, tomli 2.2.1, and PyYAML 6.0.2. It installs Rust 1.96.0 and the Android target through rustup if absent, and bootstraps vcpkg at its pinned commit if needed. The host must already provide Xcode Command Line Tools, Git, Python 3, Ninja, CMake, pkg-config, rustup, ripgrep, sed, `file`, and the Android NDK. No Homebrew package installation is performed by the script.

## Dependencies and configuration

The manifest in `native/android/vcpkg.json` builds Android target packages including GLib, libepoxy, libsamplerate, pixman, curl, libslirp, dtc/libfdt, libcbor and transitive dependencies. vcpkg build tools and the `arm64-osx` host triplet remain host executables. Vulkan headers, `libvulkan.so` link metadata, and the Android Vulkan loader interface come from the NDK; no desktop Vulkan SDK is needed.

Effective QEMU/Meson configuration enables Vulkan and disables desktop OpenGL, libpcap, virtfs and multiprocess support. `config-host.h` from the validated build has `CONFIG_VULKAN` defined and `CONFIG_OPENGL` undefined. The generated Ninja target set does not include the desktop `pgraph_gl_*` or `libgloffscreen` objects. Android `ANativeWindow`/WSI is intentionally not implemented.

## Reproduce from a clean checkout

Prerequisites are the host tools above and an installed Android NDK. From the BoxDroid repository root, use a fresh work root (which keeps generated source/build/dependency outputs out of tracked directories):

```sh
git submodule update --init upstream/xemu
export ANDROID_NDK_HOME="/path/to/android-ndk-r30.0.16248370"
export VCPKG_ROOT="$PWD/build/m2/tools/vcpkg"
export BOXDROID_M2_WORK_ROOT="$PWD/build/m2/repro-clean"
export JOBS=4
scripts/m2-android-arm64.sh
```

The script checks the upstream gitlink SHA, makes a detached Xemu worktree, applies every patch listed in `patches/xemu/series`, checks out the pinned DSP source, provisions host Python/Rust/vcpkg tooling, installs dependencies, runs upstream `configure` and Meson, and builds the target archives. It refuses to reuse a source worktree if the recorded patch series does not exactly account for its modifications. It does not initialize Xemu's unrelated firmware/ROM submodules. `VCPKG_ROOT` may instead point to an already checked-out vcpkg at the pinned commit.

The clean-checkout procedure was exercised in a new isolated work root (`build/m2/repro-validation-5`) from Xemu SHA `478b4f496102379c7eaa7f3ec10e714a703c4300` plus the BoxDroid patch series. Configure and the complete 2203-job Ninja build succeeded. A subsequent invocation of the same script reused that configured work root and reran the target and architecture checks successfully.

## Produced artifacts and architecture checks

Build directory: `build/m2/repro-validation-5/android-arm64/`.

The script builds and verifies nonempty target archives:

- `libqemu-i386-softmmu.a`
- `libsystem.a`
- `libcommon.a`
- `libblock.a`
- `libqemuutil.a`
- Rust DSP archive at `subprojects/dsp56300/cargo-target/aarch64-linux-android/release/libdsp56300_emu_ffi.a`

The script runs NDK `llvm-readelf` and fails unless these representative objects are ELF64/AArch64:

| Object | Result |
|---|---|
| NV2A Vulkan `renderer.c.o` | ELF64, REL, AArch64 |
| NV2A Vulkan `display.c.o` | ELF64, REL, AArch64 |
| `tcg/region.c.o` | ELF64, REL, AArch64 |
| `util/oslib-posix.c.o` | ELF64, REL, AArch64 |
| One member of Rust DSP FFI archive | ELF64, REL, AArch64 |
| `libglib-2.0.a` member (`localcharset.c.o`) | ELF64, REL, AArch64 |
| `libslirp.a` member (`src_arp_table.c.o`) | ELF64, REL, AArch64 |

These are Android target objects, not macOS arm64 objects. The produced static archives are intermediate link inputs; archive containers themselves do not carry a single ELF machine header. No executable, shared library, APK, or running Android process is an M2 output.

## Rust DSP handling

The Xemu subproject normally consumes a prebuilt DSP56300 archive. The referenced GitHub release asset returned HTTP 404 for the Android target. For Android only, the downstream Meson logic uses `BOXDROID_DSP56300_SOURCE` to build the pinned official Rust crate with Cargo for `aarch64-linux-android`; non-Android upstream behavior is unchanged. The script pins Rust 1.96.0, installs its Android standard library target, and sets Cargo's NDK API-33 linker. Cargo succeeds and emits the verified target archive. A nonfatal host `rust-objcopy`/`libLLVM.dylib` warning was observed during an earlier build; it did not prevent archive production.

## Blocker log and warnings

| Symptom | Classification | Resolution/status |
|---|---|---|
| Android was treated as generic Linux in host checks and feature selection | Upstream platform/configuration assumption | Downstream patch adds explicit Android detection and disables unsupported host-only subsystems. |
| Bionic lacks/varies from desktop POSIX assumptions (`shm_open`, stat nanosecond fields, host headers/APIs) | Android/Bionic | Patch uses QEMU's memfd path and handles Bionic field names; removes unused desktop-only 9p, vhost-scsi, VFIO, vDPA, IOMMUFD and userfaultfd paths. |
| NDK kernel headers conflicted with vendored Linux vhost/virtio definitions | Android headers/configuration | Unsupported host passthrough paths excluded; emulated devices remain in the target. |
| Xemu's DSP release asset was not available at the expected URL for Android | Dependency/Rust | Android builds from the pinned official DSP56300 source with Cargo instead. |
| Native Hexagon generator needed host C/C++ compilers while target compilers were Android | Cross-build tool separation | Meson build-machine C/C++ languages are enabled and set to Xcode Clang; target compilers remain NDK Clang. |
| Mac command-line tools needed an explicit SDK root when linking generated host tools | Host toolchain | Script selects and exports `SDKROOT` via `xcrun`. |
| vcpkg-generated pkg-config paths were corrupted by a target sysroot prefix | Cross dependency configuration | Script uses target pkg-config paths without `PKG_CONFIG_SYSROOT_DIR`; vcpkg metadata already contains the right target paths. |
| Host Meson setup lacked QEMU's `tomli` and `PyYAML` build-time Python modules | Host build dependency | Script installs pinned `tomli==2.2.1` and `PyYAML==6.0.2` in its isolated venv. |
| Exploratory full `qemu-system-i386` link had unresolved `main`, Xemu snapshot/notification helpers, pcap init, and QEMU integration symbols | Frontend/link boundary | Not needed to satisfy this object-and-library cross-build milestone. No executable is claimed; determine and implement the eventual Android link boundary in a later milestone. |
| SDL's optional Android Java/JNI integration could not locate an Android Java SDK during native configuration | Optional SDL host integration | Warning only; this M2 build does not package SDL's Java layer or an application. |
| NDK headers emitted a `getrandom(NULL, 0, 0)` nonnull warning; CTUCAN endian macros and deprecated `strtok` also warned | Compiler/source warnings | Nonfatal; all requested Android archives built. |

## Downstream patch scope

`patches/xemu/0001-m2-android-arm64-cross-build.patch` contains the M2-specific changes and is applied in order from `patches/xemu/series`. In addition to Android/Bionic build configuration, the patch makes libpcap optional and separates the NV2A Vulkan render/display compilation from the desktop OpenGL interop path:

- desktop OpenGL offscreen helpers and GL renderer objects are built only when OpenGL is found;
- GL texture/memory handles and external-memory interop declarations are guarded by the OpenGL configuration;
- Vulkan renderer and display Vulkan code still compile when OpenGL is disabled.

This preserves the existing desktop OpenGL behavior when enabled. It does not add placeholder GL types, Android WSI, surfaces, swapchains, or a presenter. The patch is downstream and not yet upstreamed; review for narrower upstreamable abstractions remains appropriate after M2.

## Remaining limitations

- Static archives and representative target objects compile, but no complete Android application or shared library has been linked.
- Runtime compatibility, executable-memory policy, Vulkan driver behavior, and performance on the Retroid Pocket 5 remain untested by this milestone.
- SDL emits an optional SDK/JNI warning; no frontend lifecycle is present.
- The broader Android entrypoint and remaining Xemu application-symbol integration must be scoped in the next approved milestone.
