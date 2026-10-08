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
WORK_ROOT="${BOXDROID_WORK_ROOT:-$ROOT/build/native/repro}"
SOURCE="$WORK_ROOT/source/xemu"
DSP_SOURCE="$WORK_ROOT/source/dsp56300"
BUILD="$WORK_ROOT/android-arm64"
PATCH_STATE="$WORK_ROOT/.boxdroid-patch-state"
TOOLS="$WORK_ROOT/toolchain"
PKGCONFIG="$WORK_ROOT/pkgconfig"
HOST_VENV="$WORK_ROOT/host-venv"
DEPS="${BOXDROID_ANDROID_DEPS:-$ROOT/native/android/vcpkg_installed}"
NDK="${ANDROID_NDK_HOME:-${ANDROID_NDK_ROOT:-}}"
VCPKG="${VCPKG_ROOT:-$ROOT/build/native/tools/vcpkg}"
JOBS="${JOBS:-4}"
TARGET_LIST="${BOXDROID_TARGET_LIST:-i386-softmmu}"
EXTRA_CFLAGS="${BOXDROID_EXTRA_CFLAGS--DXBOX=1}"
ENABLE_SDL="${BOXDROID_ENABLE_SDL:-1}"
RUNTIME="${BOXDROID_RUNTIME:-0}"
PRESENTER="${BOXDROID_PRESENTER:-0}"
XBOX_RUNTIME="${BOXDROID_XBOX_RUNTIME:-0}"
AUDIO="${BOXDROID_AUDIO:-0}"
INPUT="${BOXDROID_INPUT:-0}"
if [[ "$INPUT" == 1 && ( "$XBOX_RUNTIME" != 1 || "$AUDIO" != 1 ) ]]; then
    echo "error: input requires the Xbox runtime and audio" >&2
    exit 1
fi
NEED_I386=0
if [[ ",${TARGET_LIST}," == *,i386-softmmu,* ]]; then
    NEED_I386=1
fi

die() { echo "error: $*" >&2; exit 1; }

patch_series_hash() {
    {
        git -C "$ROOT" hash-object "$ROOT/patches/xemu/series"
        while IFS= read -r patch_name; do
            [[ -n "$patch_name" ]] || continue
            printf '%s ' "$patch_name"
            git -C "$ROOT" hash-object "$ROOT/patches/xemu/$patch_name"
        done < "$ROOT/patches/xemu/series"
    } | git -C "$ROOT" hash-object --stdin
}

source_diff_hash() {
    git -C "$SOURCE" diff --binary | git -C "$ROOT" hash-object --stdin
}

[[ "$(uname -s)" == Darwin ]] || die "this toolchain is documented for macOS hosts"
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

if [[ "$NEED_I386" == 1 ]]; then
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
else
    CARGO_BIN="$(dirname "$(rustup which cargo)")"
fi

if git -C "$SOURCE" diff --quiet; then
    while IFS= read -r patch_name; do
        [[ -n "$patch_name" ]] || continue
        patch_path="$ROOT/patches/xemu/$patch_name"
        git -C "$SOURCE" apply --unidiff-zero --check "$patch_path"
        git -C "$SOURCE" apply --unidiff-zero "$patch_path"
    done < "$ROOT/patches/xemu/series"
else
    current_state="$(patch_series_hash) $(source_diff_hash)"
    if [[ -s "$PATCH_STATE" ]] && [[ "$(cat "$PATCH_STATE")" == "$current_state" ]]; then
        echo "Verified exact previously applied downstream patch series"
    else
        python3 "$ROOT/scripts/verify-xemu-patches.py" "$SOURCE" "$PIN" || \
            die "source worktree differs from the ordered downstream patch series"
    fi
fi

printf '%s %s\n' "$(patch_series_hash)" "$(source_diff_hash)" > "$PATCH_STATE"

if [[ "$XBOX_RUNTIME" == 1 ]]; then
    [[ "$TARGET_LIST" == i386-softmmu ]] || \
        die "Xbox runtime currently requires BOXDROID_TARGET_LIST=i386-softmmu"
    cp "$ROOT/native/android/core/boxdroid-xbox-runtime.c" "$SOURCE/system/boxdroid-xbox-runtime.c"
    cp "$ROOT/native/android/core/boxdroid-xbox-settings.c" "$SOURCE/system/boxdroid-xbox-settings.c"
    cp "$ROOT/native/android/core/boxdroid.map" "$SOURCE/system/boxdroid.map"
    cp "$ROOT/native/android/core/boxdroid-vulkan-presenter.cpp" "$SOURCE/system/boxdroid-vulkan-presenter.cpp"
    cp "$ROOT/native/android/core/boxdroid-frame-queue.h" "$SOURCE/system/boxdroid-frame-queue.h"
    cp "$ROOT/native/android/core/boxdroid-diagnostics.h" "$SOURCE/hw/xbox/nv2a/boxdroid-diagnostics.h"
    cp "$ROOT/native/android/core/boxdroid-diagnostics.h" "$SOURCE/system/boxdroid-diagnostics.h"
    if [[ "$AUDIO" == 1 ]]; then
        cp "$ROOT/native/android/core/boxdroid-audio.c" "$SOURCE/system/boxdroid-audio.c"
        cp "$ROOT/native/android/core/boxdroid-audio.h" "$SOURCE/hw/xbox/mcpx/apu/boxdroid-audio.h"
        cp "$ROOT/native/android/core/boxdroid-audio.h" "$SOURCE/system/boxdroid-audio.h"
    fi
    if [[ "$INPUT" == 1 ]]; then
        [[ "$AUDIO" == 1 ]] || die "input requires the audio baseline"
        cp "$ROOT/native/android/core/boxdroid-input.c" "$SOURCE/system/boxdroid-input.c"
        cp "$ROOT/native/android/core/boxdroid-input.h" "$SOURCE/system/boxdroid-input.h"
    fi
elif [[ "$RUNTIME" == 1 ]]; then
    [[ "$TARGET_LIST" == aarch64-softmmu ]] || \
        die "embedded runtime currently requires BOXDROID_TARGET_LIST=aarch64-softmmu"
    runtime_source="$ROOT/native/android/core/boxdroid-runtime.c"
    runtime_header="$ROOT/native/android/core/boxdroid-runtime.h"
    runtime_map="$ROOT/native/android/core/boxdroid.map"
    [[ -s "$runtime_source" ]] || die "missing BoxDroid runtime source: $runtime_source"
    [[ -s "$runtime_header" ]] || die "missing BoxDroid runtime API header: $runtime_header"
    [[ -s "$runtime_map" ]] || die "missing BoxDroid symbol map: $runtime_map"
    cp "$runtime_source" "$SOURCE/system/boxdroid-runtime.c"
    cp "$runtime_header" "$SOURCE/system/boxdroid-runtime.h"
    cp "$runtime_map" "$SOURCE/system/boxdroid.map"
    if [[ "$PRESENTER" == 1 ]]; then
        presenter_source="$ROOT/native/android/core/boxdroid-vulkan-presenter.cpp"
        [[ -s "$presenter_source" ]] || die "missing BoxDroid presenter source: $presenter_source"
        cp "$presenter_source" "$SOURCE/system/boxdroid-vulkan-presenter.cpp"
        cp "$ROOT/native/android/core/boxdroid-frame-queue.h" "$SOURCE/system/boxdroid-frame-queue.h"
    fi
elif [[ "$PRESENTER" == 1 ]]; then
    die "presenter requires BOXDROID_RUNTIME=1"
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
    configure_args=( \
        --cross-prefix="$TOOLS/${TRIPLE}${API}-" \
        --cc="$CC" --cxx="$CXX" --host-cc="$HOST_CC" \
        --python="$(command -v python3)" --ninja="$(command -v ninja)" \
        --extra-cflags="$EXTRA_CFLAGS" --target-list="$TARGET_LIST" \
        --enable-slirp --enable-curl --enable-pixman \
        --disable-opengl --disable-rust --disable-docs \
        --disable-user --disable-guest-agent --disable-tools \
        -Dauto_features=disabled -Dlibpcap=disabled -Dopengl=disabled \
        -Dvirtfs=disabled -Dmultiprocess=disabled -Ddocs=disabled \
        -Dfdt=enabled -Dlibcbor=enabled \
    )
    # Opt-in release profile for isolated performance experiments. Existing
    # milestone builds retain their original compiler and QOM debug options.
    if [[ "${BOXDROID_OPTIMIZED_BUILD:-0}" == 1 ]]; then
        configure_args+=( -Doptimization=3 -Dqom_cast_debug=false
                          -Db_lto=true -Db_lto_mode=thin )
    fi
    if [[ "$ENABLE_SDL" == 1 ]]; then
        configure_args+=( --enable-sdl )
    else
        configure_args+=( --disable-sdl )
    fi
    if [[ "${BOXDROID_STATIC_PIC:-0}" == 1 ]]; then
        configure_args+=( -Db_staticpic=true )
    fi
    if [[ "$RUNTIME" == 1 ]]; then
        configure_args+=( -Dboxdroid_runtime=true )
    fi
    if [[ "$PRESENTER" == 1 ]]; then
        configure_args+=( -Dboxdroid_presenter=true )
    fi
    if [[ "$XBOX_RUNTIME" == 1 ]]; then
        configure_args+=( -Dboxdroid_xbox_runtime=true )
    fi
    if [[ "$AUDIO" == 1 ]]; then
        configure_args+=( -Dboxdroid_audio=true )
    else
        configure_args+=( -Dboxdroid_audio=false )
    fi
    if [[ "$INPUT" == 1 ]]; then
        configure_args+=( -Dboxdroid_input=true )
    else
        configure_args+=( -Dboxdroid_input=false )
    fi
    "$SOURCE/configure" \
        "${configure_args[@]}"
else
    echo "Reusing configured Meson build at $BUILD"
    if [[ "$RUNTIME" == 1 ]]; then
        meson_args=( -Dboxdroid_runtime=true )
        if [[ "$PRESENTER" == 1 ]]; then
            meson_args+=( -Dboxdroid_presenter=true )
        fi
        "$HOST_VENV/bin/meson" configure "$BUILD" "${meson_args[@]}"
    fi
    if [[ "$XBOX_RUNTIME" == 1 ]]; then
        "$HOST_VENV/bin/meson" configure "$BUILD" -Dboxdroid_xbox_runtime=true
    fi
    if [[ "$AUDIO" == 1 ]]; then
        "$HOST_VENV/bin/meson" configure "$BUILD" -Dboxdroid_audio=true
    else
        "$HOST_VENV/bin/meson" configure "$BUILD" -Dboxdroid_audio=false
    fi
    if [[ "$INPUT" == 1 ]]; then
        "$HOST_VENV/bin/meson" configure "$BUILD" -Dboxdroid_input=true
    else
        "$HOST_VENV/bin/meson" configure "$BUILD" -Dboxdroid_input=false
    fi
fi

if [[ -n "${BOXDROID_OPTIMIZED_BUILD+x}" ]]; then
    python3 - "$BUILD/meson-info/intro-buildoptions.json" "$BOXDROID_OPTIMIZED_BUILD" <<'PY'
import json, sys
options = {row['name']: row['value'] for row in json.load(open(sys.argv[1]))}
optimized = sys.argv[2] == '1'
expected = {'optimization': '3' if optimized else '2',
            'qom_cast_debug': not optimized, 'b_lto': optimized}
if optimized:
    expected['b_lto_mode'] = 'thin'
if any(options[key] != value for key, value in expected.items()):
    raise SystemExit('build profile differs: select a fresh work root for this experiment')
PY
fi

ninja_targets=( libsystem.a libcommon.a libblock.a libqemuutil.a )
IFS=',' read -r -a configured_targets <<< "$TARGET_LIST"
for target in "${configured_targets[@]}"; do
    ninja_targets+=( "libqemu-$target.a" )
done
ninja -C "$BUILD" -j"$JOBS" "${ninja_targets[@]}"

echo "Android $ABI core archives built from Xemu $PIN in $BUILD"
for artifact in "${ninja_targets[@]}"; do
    [[ -s "$BUILD/$artifact" ]] || die "missing target archive: $artifact"
    echo "$(file "$BUILD/$artifact")"
done

verify_aarch64() {
    local object="$1"
    [[ -s "$object" ]] || die "missing Android target object: $object"
    local header
    if [[ "${BOXDROID_OPTIMIZED_BUILD:-0}" == 1 ]] && file "$object" | rg -q 'LLVM IR bitcode'; then
        # ThinLTO objects are IR until the shared-library link. Validate their
        # target here; the runtime script still verifies the final ELF header.
        "$NDK_BIN/llvm-dis" "$object" -o "$BUILD/verify-target.ll"
        rg -q '^target triple = "aarch64-.*android' "$BUILD/verify-target.ll" ||
            die "not Android AArch64 bitcode: $object"
        echo "Verified Android AArch64 ThinLTO object: $object"
        return
    fi
    header="$("$NDK_BIN/llvm-readelf" -h "$object")"
    echo "$header" | rg -q 'Class:\s+ELF64' || die "not an ELF64 object: $object"
    echo "$header" | rg -q 'Machine:\s+AArch64' || die "not an AArch64 object: $object"
    echo "Verified Android target object: $(file "$object")"
}

if [[ ",${TARGET_LIST}," == *,i386-softmmu,* ]]; then
    verify_aarch64 "$BUILD/libqemu-i386-softmmu.a.p/hw_xbox_nv2a_pgraph_vk_renderer.c.o"
    verify_aarch64 "$BUILD/libqemu-i386-softmmu.a.p/hw_xbox_nv2a_pgraph_vk_display.c.o"
fi
verify_aarch64 "$BUILD/libsystem.a.p/tcg_region.c.o"
verify_aarch64 "$BUILD/libqemuutil.a.p/util_oslib-posix.c.o"

if [[ "$NEED_I386" == 1 ]]; then
    DSP_ARCHIVE="$BUILD/subprojects/dsp56300/cargo-target/$TRIPLE/release/libdsp56300_emu_ffi.a"
    [[ -s "$DSP_ARCHIVE" ]] || die "missing Rust DSP target archive: $DSP_ARCHIVE"
    DSP_MEMBER="$("$NDK_BIN/llvm-ar" t "$DSP_ARCHIVE" | sed -n '1p')"
    [[ -n "$DSP_MEMBER" ]] || die "Rust DSP target archive has no members"
    DSP_HEADER="$("$NDK_BIN/llvm-ar" p "$DSP_ARCHIVE" "$DSP_MEMBER" | "$NDK_BIN/llvm-readelf" -h -)"
    echo "$DSP_HEADER" | rg -q 'Class:\s+ELF64' || die "Rust DSP archive member is not ELF64"
    echo "$DSP_HEADER" | rg -q 'Machine:\s+AArch64' || die "Rust DSP archive member is not AArch64"
    echo "Verified Android Rust DSP archive member: ELF64 AArch64 ($DSP_MEMBER)"
fi
