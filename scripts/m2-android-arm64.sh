#!/usr/bin/env bash
set -euo pipefail

# Reconstruct and cross-compile the pinned Xemu/QEMU Android ARM64 core.
# This intentionally builds static target archives, not an Android app or
# standalone executable; the Android frontend/entry point belongs to a later
# milestone.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PIN=478b4f496102379c7eaa7f3ec10e714a703c4300
DSP_PIN=bde7c233a447d32d558c48cb4438e1425fe0bbcc
VCPKG_PIN=a42757564758c60651ebc616d9b000b7b91249ef
API=33
ABI=arm64-v8a
TRIPLE=aarch64-linux-android
WORK_ROOT="${BOXDROID_M2_WORK_ROOT:-$ROOT/build/m2/repro}"
SOURCE="$WORK_ROOT/source/xemu"
DSP_SOURCE="$WORK_ROOT/source/dsp56300"
BUILD="$WORK_ROOT/android-arm64"
TOOLS="$WORK_ROOT/toolchain"
PKGCONFIG="$WORK_ROOT/pkgconfig"
HOST_VENV="$WORK_ROOT/host-venv"
DEPS="${BOXDROID_ANDROID_DEPS:-$ROOT/native/android/vcpkg_installed}"
NDK="${ANDROID_NDK_HOME:-${ANDROID_NDK_ROOT:-}}"
VCPKG="${VCPKG_ROOT:-$ROOT/build/m2/tools/vcpkg}"
JOBS="${JOBS:-4}"

die() { echo "error: $*" >&2; exit 1; }

[[ "$(uname -s)" == Darwin ]] || die "this M2 toolchain is documented for macOS hosts"
[[ -n "$NDK" && -d "$NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin" ]] || \
    die "set ANDROID_NDK_HOME to an installed macOS Android NDK"
[[ -e "$ROOT/upstream/xemu/.git" || -f "$ROOT/upstream/xemu/.git" ]] || \
    git -C "$ROOT" submodule update --init upstream/xemu
[[ "$(git -C "$ROOT/upstream/xemu" rev-parse HEAD)" == "$PIN" ]] || \
    die "upstream/xemu is not pinned at $PIN"

for tool in git python3 ninja cmake pkg-config rustup rg sed file xcrun; do
    command -v "$tool" >/dev/null || die "missing host tool: $tool"
done

if [[ ! -x "$HOST_VENV/bin/meson" ]]; then
    python3 -m venv "$HOST_VENV"
fi
"$HOST_VENV/bin/python" -m pip install --disable-pip-version-check \
    'meson==1.9.0' 'tomli==2.2.1' 'PyYAML==6.0.2'
export PATH="$HOST_VENV/bin:$PATH"

if [[ ! -x "$VCPKG/vcpkg" ]]; then
    VCPKG="$WORK_ROOT/tools/vcpkg"
    mkdir -p "$(dirname "$VCPKG")"
    git clone https://github.com/microsoft/vcpkg.git "$VCPKG"
    git -C "$VCPKG" checkout --detach "$VCPKG_PIN"
    "$VCPKG/bootstrap-vcpkg.sh" -disableMetrics
fi
[[ "$(git -C "$VCPKG" rev-parse HEAD)" == "$VCPKG_PIN" ]] || \
    die "vcpkg tool checkout must be pinned at $VCPKG_PIN"

mkdir -p "$WORK_ROOT" "$TOOLS" "$PKGCONFIG"
if [[ ! -d "$SOURCE/.git" && ! -f "$SOURCE/.git" ]]; then
    mkdir -p "$(dirname "$SOURCE")"
    git -C "$ROOT/upstream/xemu" worktree add --detach "$SOURCE" "$PIN"
fi
[[ "$(git -C "$SOURCE" rev-parse HEAD)" == "$PIN" ]] || \
    die "source worktree is not at pinned Xemu commit $PIN"

if [[ ! -d "$DSP_SOURCE/.git" && ! -f "$DSP_SOURCE/.git" ]]; then
    git clone https://github.com/mborgerson/dsp56300.git "$DSP_SOURCE"
    git -C "$DSP_SOURCE" checkout --detach "$DSP_PIN"
fi
[[ "$(git -C "$DSP_SOURCE" rev-parse HEAD)" == "$DSP_PIN" ]] || \
    die "DSP56300 source is not at pinned commit $DSP_PIN"
git -C "$DSP_SOURCE" diff --quiet || die "DSP56300 source checkout has local changes"
if ! rustup toolchain list | rg -q '^1\.96\.0([ -]|$)'; then
    rustup toolchain install 1.96.0 --profile minimal
fi
rustup target add --toolchain 1.96.0 "$TRIPLE"
CARGO_BIN="$(dirname "$(rustup which cargo --toolchain 1.96.0)")"

if git -C "$SOURCE" diff --quiet; then
    while IFS= read -r patch_name; do
        [[ -n "$patch_name" ]] || continue
        patch_path="$ROOT/patches/xemu/$patch_name"
        git -C "$SOURCE" apply --unidiff-zero --check "$patch_path"
        git -C "$SOURCE" apply --unidiff-zero "$patch_path"
    done < "$ROOT/patches/xemu/series"
else
    # Reuse is allowed only when the exact downstream series is already
    # applied. Never layer over unknown local edits.
    while IFS= read -r patch_name; do
        [[ -n "$patch_name" ]] || continue
        patch_path="$ROOT/patches/xemu/$patch_name"
        git -C "$SOURCE" apply --unidiff-zero --reverse --check "$patch_path" || \
            die "source worktree has changes outside the recorded patch series"
    done < "$ROOT/patches/xemu/series"
fi

mkdir -p "$BUILD"

NDK_BIN="$NDK/toolchains/llvm/prebuilt/darwin-x86_64/bin"
HOST_CC="$(xcrun --find clang)"
HOST_SDKROOT="$(xcrun --show-sdk-path)"
CC="$NDK_BIN/${TRIPLE}${API}-clang"
CXX="$NDK_BIN/${TRIPLE}${API}-clang++"
AR="$NDK_BIN/llvm-ar"
for pair in \
    "${TRIPLE}${API}-gcc:$CC" "${TRIPLE}${API}-clang:$CC" \
    "${TRIPLE}${API}-g++:$CXX" "${TRIPLE}${API}-clang++:$CXX" \
    "${TRIPLE}${API}-ar:$AR" "${TRIPLE}${API}-nm:$NDK_BIN/llvm-nm" \
    "${TRIPLE}${API}-ranlib:$NDK_BIN/llvm-ranlib" \
    "${TRIPLE}${API}-strip:$NDK_BIN/llvm-strip" \
    "${TRIPLE}${API}-objcopy:$NDK_BIN/llvm-objcopy" \
    "${TRIPLE}${API}-readelf:$NDK_BIN/llvm-readelf"; do
    name="${pair%%:*}"
    target="${pair#*:}"
    ln -sfn "$target" "$TOOLS/$name"
done
ln -sfn "$(command -v pkg-config)" "$TOOLS/${TRIPLE}${API}-pkg-config"

SYSROOT="$NDK/toolchains/llvm/prebuilt/darwin-x86_64/sysroot"
cat > "$PKGCONFIG/vulkan.pc" <<EOF
prefix=$SYSROOT/usr
libdir=\${prefix}/lib/aarch64-linux-android/$API
includedir=\${prefix}/include
Name: Vulkan
Description: Android NDK Vulkan system library
Version: 1.3.0
Libs: -L\${libdir} -lvulkan
Cflags: -I\${includedir}
EOF

export ANDROID_NDK_HOME="$NDK"
export ANDROID_NDK_ROOT="$NDK"
export ANDROID_NATIVE_API_LEVEL="$API"
export SDKROOT="$HOST_SDKROOT"
export BOXDROID_CMAKE_TOOLCHAIN_FILE="$ROOT/native/android/cmake-android-toolchain.cmake"
export VCPKG_ROOT="$VCPKG"
export VCPKG_CHAINLOAD_TOOLCHAIN_FILE="$BOXDROID_CMAKE_TOOLCHAIN_FILE"
export BOXDROID_DSP56300_SOURCE="$DSP_SOURCE"
export RUSTUP_TOOLCHAIN=1.96.0
export CARGO_TARGET_AARCH64_LINUX_ANDROID_LINKER="$NDK_BIN/${TRIPLE}${API}-clang"
export PATH="$TOOLS:$NDK_BIN:$CARGO_BIN:$PATH"
export PKG_CONFIG_LIBDIR="$DEPS/arm64-android-api33/lib/pkgconfig:$DEPS/arm64-android-api33/share/pkgconfig:$PKGCONFIG"
unset PKG_CONFIG_PATH

cd "$ROOT/native/android"
"$VCPKG/vcpkg" install \
    --triplet=arm64-android-api33 \
    --host-triplet=arm64-osx \
    --overlay-triplets="$ROOT/native/android/triplets" \
    --x-install-root="$DEPS"

cd "$BUILD"
if [[ ! -e "$BUILD/meson-private/coredata.dat" ]]; then
    "$SOURCE/configure" \
        --cross-prefix="$TOOLS/${TRIPLE}${API}-" \
        --cc="$CC" --cxx="$CXX" --host-cc="$HOST_CC" \
        --python="$(command -v python3)" --ninja="$(command -v ninja)" \
        --extra-cflags=-DXBOX=1 --target-list=i386-softmmu \
        --enable-sdl --enable-slirp --enable-curl --enable-pixman \
        --disable-opengl --disable-rust --disable-docs \
        --disable-user --disable-guest-agent --disable-tools \
        -Dauto_features=disabled -Dlibpcap=disabled -Dopengl=disabled \
        -Dvirtfs=disabled -Dmultiprocess=disabled -Ddocs=disabled \
        -Dfdt=enabled -Dlibcbor=enabled
else
    echo "Reusing configured Meson build at $BUILD"
fi

ninja -C "$BUILD" -j"$JOBS" \
    libqemu-i386-softmmu.a libsystem.a libcommon.a libblock.a libqemuutil.a

echo "Android $ABI core archives built from Xemu $PIN in $BUILD"
for artifact in libqemu-i386-softmmu.a libsystem.a libcommon.a libblock.a libqemuutil.a; do
    [[ -s "$BUILD/$artifact" ]] || die "missing target archive: $artifact"
    echo "$(file "$BUILD/$artifact")"
done

verify_aarch64() {
    local object="$1"
    [[ -s "$object" ]] || die "missing Android target object: $object"
    local header
    header="$("$NDK_BIN/llvm-readelf" -h "$object")"
    echo "$header" | rg -q 'Class:\s+ELF64' || die "not an ELF64 object: $object"
    echo "$header" | rg -q 'Machine:\s+AArch64' || die "not an AArch64 object: $object"
    echo "Verified Android target object: $(file "$object")"
}

verify_aarch64 "$BUILD/libqemu-i386-softmmu.a.p/hw_xbox_nv2a_pgraph_vk_renderer.c.o"
verify_aarch64 "$BUILD/libqemu-i386-softmmu.a.p/hw_xbox_nv2a_pgraph_vk_display.c.o"
verify_aarch64 "$BUILD/libsystem.a.p/tcg_region.c.o"
verify_aarch64 "$BUILD/libqemuutil.a.p/util_oslib-posix.c.o"

DSP_ARCHIVE="$BUILD/subprojects/dsp56300/cargo-target/$TRIPLE/release/libdsp56300_emu_ffi.a"
[[ -s "$DSP_ARCHIVE" ]] || die "missing Rust DSP target archive: $DSP_ARCHIVE"
DSP_MEMBER="$("$NDK_BIN/llvm-ar" t "$DSP_ARCHIVE" | sed -n '1p')"
[[ -n "$DSP_MEMBER" ]] || die "Rust DSP target archive has no members"
DSP_HEADER="$("$NDK_BIN/llvm-ar" p "$DSP_ARCHIVE" "$DSP_MEMBER" | "$NDK_BIN/llvm-readelf" -h -)"
echo "$DSP_HEADER" | rg -q 'Class:\s+ELF64' || die "Rust DSP archive member is not ELF64"
echo "$DSP_HEADER" | rg -q 'Machine:\s+AArch64' || die "Rust DSP archive member is not AArch64"
echo "Verified Android Rust DSP archive member: ELF64 AArch64 ($DSP_MEMBER)"
