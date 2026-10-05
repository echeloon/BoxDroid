# M1: pinned Xemu baseline and macOS build

This document records the M1 source baseline and the successful desktop build performed on 2026-09-30. No Android platform changes have been applied to Xemu.

## Official source and pin

- Canonical upstream: <https://github.com/xemu-project/xemu.git>
- Branch at selection: `master` (the repository's default branch)
- Exact commit: `478b4f496102379c7eaa7f3ec10e714a703c4300`
- Commit subject: `ci: bump docker/setup-buildx-action from 4.3.0 to 4.4.1`
- Commit date: `2026-09-28T23:19:32-07:00`
- Ref information at selection: `master` and the `pre-release` tag both resolved to this commit. It is `pre-release-0-g478b4f4961` according to `git describe --tags --long`; `v0.8.136` was the latest numbered `v*` tag in the checkout.
- Built Xemu version: `0.8.136-53-g478b4f4961`; bundled QEMU version: `10.2.0`.

The commit was selected because it was the live official `master`/`HEAD` when M1 began, is an immutable full SHA, and is the source revision against which this desktop build was reproduced. The version tag is descriptive only; the full SHA is authoritative. This deliberately does not use an Android fork.

## BoxDroid/Xemu relationship

`upstream/xemu` is a Git submodule whose URL is the official Xemu repository. BoxDroid's parent repository pins it with a gitlink at the exact commit above. Recursive upstream submodules are initialized at the commits recorded by Xemu. No Xemu source file is copied or modified in the BoxDroid parent repository.

The downstream fork base is therefore the official commit above; no separate Xemu fork or downstream Xemu commit exists yet. Keep BoxDroid Android work in the parent repository. Future changes that need Xemu/QEMU source should be reviewed as a small series of Git-format patches under `patches/xemu/`, based on the pinned commit. Prefer upstreaming generic changes. When rebasing the series onto a newer official commit, update the parent gitlink and this baseline record together, review each patch for conflicts, and rebuild before accepting the new pin. The current policy is described in [patches/xemu/README.md](../../patches/xemu/README.md).

The upstream source remains independently inspectable with:

```sh
git -C upstream/xemu remote -v
git -C upstream/xemu status --short --branch
git -C upstream/xemu rev-parse HEAD
```

Expected `HEAD` is `478b4f496102379c7eaa7f3ec10e714a703c4300`, detached at the parent repository's pin.

## Reproduce the checkout

When starting from a BoxDroid clone, initialize the pinned upstream source and all nested submodules with:

```sh
git submodule update --init --recursive upstream/xemu
git -C upstream/xemu rev-parse HEAD
```

The first command follows the gitlink recorded by the checked-out BoxDroid revision; it does not follow a moving upstream branch. The second command should print the full SHA above. A fresh BoxDroid clone can also use `git clone --recurse-submodules`.

## macOS host and dependencies used

Host used for the M1 reproduction:

- macOS `27.0` (build `26A428`), Apple M1 Pro, `arm64`
- Xcode Command Line Tools `xcrun 72`, macOS SDK `27.0`
- Apple Clang `21.0.0` (`clang-2100.3.34.2`)
- Homebrew `7.0.7`
- Python `3.9.6` from the Command Line Tools

The current [official macOS build guide](https://xemu.app/docs/dev/building-from-source/) prescribes Homebrew `coreutils`, `pkg-config`, `dylibbundler`, `ninja`, PyYAML, and the upstream `./build.sh` procedure. This revision's `hw/xbox/nv2a/pgraph/thirdparty/meson.build` also requires CMake for its `nv2a_vsh_cpu` subproject, although CMake is omitted from that macOS dependency list. The first configure attempt confirmed it was required. With the host's Python 3.9, upstream `configure` also reported `found no usable tomli`; `tomli` was installed in the user Python environment.

Installed direct host dependencies and versions:

| Dependency | Version used |
|---|---:|
| coreutils | 9.12 |
| pkg-config (`pkgconf`) | 3.0.7 |
| dylibbundler | 1.0.5 |
| Ninja | 1.13.2 |
| CMake | 4.4.3 |
| PyYAML | 6.0.3 |
| tomli | 2.4.1 |

Install the host tools using the upstream-prescribed Homebrew packages plus the CMake dependency found in the current source:

```sh
brew install coreutils pkg-config dylibbundler ninja cmake
python3 -m pip install --user pyyaml==6.0.3 tomli==2.4.1
```

The build script downloaded arm64 macOS runtime dependencies from MacPorts, verified their signatures, and recorded these selected package versions in the generated `macos-libs/arm64/INSTALLED` file:

```text
SDL3=3.4.8_0
glib2=2.88.3_2+dbus+x11
libsamplerate=0.2.2_0
libpixman=0.46.0_0
libepoxy=1.5.10_4+x11
libpcap=1.11.0_0
libslirp=4.9.1_0
libusb=1.0.30_0
gettext-runtime=1.0_0
libelf=0.8.13_6
libffi=3.4.8_0
libiconv=1.19_0
pcre2=10.48_0
zlib=1.3.2_0
dbus=1.16.2_0
bzip2=1.0.8_1
libedit=20260512-3.1_0
expat=2.8.4_0
```

These runtime package versions are recorded for this reproduction. The upstream download script resolves current MacPorts package listings at build time, so rebuilding much later can select newer packages unless that upstream behavior is separately pinned.

## Reproduce the upstream desktop build

Run the upstream build script from the submodule root. Do not replace it with a BoxDroid-specific build system for this baseline:

```sh
cd upstream/xemu
./build.sh
```

On this host, `./build.sh` selected native `arm64`, `--target-list=i386-softmmu`, disabled Cocoa as directed by the script, and targeted macOS 14.0+ using SDK 27.0. QEMU's configure step provisioned Meson `1.9.0` and pycotap `1.3.1` in its build virtual environment. The successful build output is `upstream/xemu/dist/xemu.app`; build products, downloaded dependencies, and subprojects remain inside the upstream submodule and are ignored by upstream's own Git rules.

The initial configure run failed before compilation because this host lacked `tomli`. The second attempt exposed the missing CMake prerequisite. After installing those required host dependencies, the unchanged upstream `./build.sh` completed successfully.

## Launch and invocation

The documented upstream launch command is:

```sh
open ./dist/xemu.app
```

The build and package commands succeeded, but on macOS 27.0 the generated executable contained two identical `LC_RPATH` entries for `@executable_path/../Libraries/arm64/`. `dyld` aborted on startup with exit 134. `otool -l` confirmed the duplicate. This is in upstream's generated packaging output, not a source modification. Removing one duplicate from the generated app executable and re-signing the app restored launch:

```sh
app_exe=dist/xemu.app/Contents/MacOS/xemu
if [ "$(otool -l "$app_exe" | grep -F -c 'path @executable_path/../Libraries/arm64/')" -gt 1 ]; then
  install_name_tool -delete_rpath '@executable_path/../Libraries/arm64/' "$app_exe"
  codesign --force --deep --sign - dist/xemu.app
fi
open ./dist/xemu.app
```

After that cleanup, `open` launched a live `xemu` process. The app bundle also passed `codesign --verify --deep --strict`. A non-GUI executable invocation verified the selected revision and returned exit status 0:

```sh
./dist/xemu.app/Contents/MacOS/xemu --version
```

It printed Xemu `0.8.136-53-g478b4f4961`, full commit `478b4f496102379c7eaa7f3ec10e714a703c4300`, and QEMU `10.2.0`. This is only a desktop launch check; no Xbox firmware or game image was supplied.

## M1 scope and remaining limits

- The Xemu submodule is at the official upstream commit above and its tracked source is clean.
- No Android/NDK cross-compilation or Android platform code was attempted.
- No Xbox BIOS, MCPX ROM, HDD image, or game image was added.
- Clang emitted nonfatal upstream/third-party warnings; the upstream configure step also disabled documentation because Sphinx was unavailable and reported PIE toolchain support disabled. Neither prevented the desktop build or launch.
- For an exact fresh rebuild, use the pinned BoxDroid revision, recursively initialized submodules, the recorded host dependency set, and the upstream build command. The upstream MacPorts resolver is time-varying as noted above.
