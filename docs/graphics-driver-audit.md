# Custom Vulkan driver source audit

Audited on 2026-10-11 on `vulkan-turnip`, starting at
`5d06e624ecdb736db0c913fe8d3d9afef8cbe76d`. The feature was already committed
and pushed before this audit. The working tree and index were clean; ordinary,
cached, and whitespace diffs were empty. This audit adds one follow-up commit
with the requested message `feat: add custom Vulkan driver support`.

## Source and licensing corrections

- Removed 28 unused upstream files: ROM/driver tools, QTI mapper shims, unused
  BCn patching code and generated patch bytes, regeneration script, and standalone
  installation template. CMake now builds the driver-loading translation unit
  and its existing namespace/hook dependencies. No Vulkan loading behavior was
  changed by this trimming.
- Retained both complete BSD-2-Clause licenses and all copyright/SPDX notices.
  Packaged byte-identical BSD notices in APK assets for binary redistribution.
- Preserved the KGSL UAPI header's `GPL-2.0 WITH Linux-syscall-note` marking and
  Linux Foundation/Qualcomm copyright notices. Packaged its full license and
  syscall exception as source and APK materials. The exception is documented in
  [Linux's license text](https://github.com/torvalds/linux/blob/master/LICENSES/exceptions/Linux-syscall-note).
- Compared every retained vendor file's Git blob hash with the pinned upstream
  revisions: 20 exact matches; the sole local difference is the documented
  libadrenotools CMake reduction. Verified the nested dependency's exact gitlink.
  Source URLs, revisions and local differences are in
  [UPSTREAM.md](../native/android/driver/UPSTREAM.md).
- Marked the original validation report's pre-commit status/inventory as
  historical, preserving its functional validation record.

## Implementation review

- No runtime dependency on `/sdcard/Download/`, a Turnip package filename, the
  Retroid model, Snapdragon 865, or Adreno 650. Those identifiers in the original
  validation report describe the test package/device. Package metadata and
  generic ELF/ZIP checks determine import behavior.
- SYSTEM retains the original presenter `dlopen("libvulkan.so")` and Xemu
  `volkInitialize()` paths, with no custom support-library setup.
- CUSTOM selects the app-private `Context.getFilesDir()/graphics-drivers/custom`
  package before presenter/Xemu instance creation, using the isolated Android
  loader and custom Volk initialization. SAF is used only for import.
- Validation rejects bad packages before selection and removes partial staging;
  native probe failure is isolated from the frontend. Initialization fallback,
  persisted SYSTEM, interrupted-startup recovery and visible errors are intact.
- Existing BIOS/MCPX/HDD picker callbacks, grants, preference keys and native
  firmware handling are unchanged. The existing row/controller implementation
  is reused, with the feature's nested Back handling intact.
- No unrelated emulator, audio, input, worker, timer, profiling or performance
  code was modified. Existing performance documentation/figures on `main` are
  outside the feature diff and were left untouched.

## Checks

Passed:

- `git diff --check` and final staged whitespace check.
- Five existing tests: `python3 -m unittest discover -s tests/native -p 'test_*.py'`.
- Ordered downstream patch verification at pinned Xemu revision
  `478b4f496102379c7eaa7f3ec10e714a703c4300`.
- `BOXDROID_INSTALL=0 ./scripts/build-android.sh`: loader/hooks, Xemu native core,
  React frontend and Android debug APK. Existing compiler/deprecation warnings
  remain; build completed successfully.
- Final Gradle packaging using the same Android SDK/JDK settings as the build
  script, after all notices were added. Each of the three APK notice entries
  was compared byte-for-byte with its source file.
- Git index/branch file inventory and content-signature audit: no new ZIP, APK,
  ELF library, build output, logcat, profiling file, screenshot, validation
  capture or scratch file is included. Existing ignore rules cover build and
  validation outputs and generated WebView assets. APK contents include no
  bundled custom GPU driver or driver ZIP.

Existing device functional evidence was reviewed from ignored local validation
files: both Vulkan consumers used Turnip after import and Qualcomm after
UI deletion, including safe fallback, invalid ZIP rejection, controller
navigation and system-file regression checks. The runtime implementations are
unchanged by this audit. No benchmark or new performance experiment was run.
Build logs and upstream comparison checkouts remain under ignored
`build/audit/vulkan-turnip/`; no captures or build products enter this commit.

## Protected refs

Before the audit, local `main`, tracking `origin/main`, and the actual remote
`refs/heads/main` all pointed to
`791b08ca7153aa6edaeca2aef3b0dab0209ba59d`. The audit commit is on `vulkan-turnip`
and is pushed only to `refs/heads/vulkan-turnip`. No main ref is modified,
history is not rewritten, and no merge is performed.

## Exact files in the audit commit

`A` means added, `M` modified, and `D` removed. This is the follow-up audit
commit's inventory, relative to its parent `5d06e62`; the original feature
implementation remains in that parent.

```text
A android/app/src/main/assets/third-party-notices/kgsl-uapi.txt
A android/app/src/main/assets/third-party-notices/libadrenotools.txt
A android/app/src/main/assets/third-party-notices/liblinkernsbypass.txt
A docs/graphics-driver-audit.md
M docs/graphics-driver-validation.md
M native/android/driver/UPSTREAM.md
M native/android/driver/libadrenotools/CMakeLists.txt
D native/android/driver/libadrenotools/adrenotools.pc.in
D native/android/driver/libadrenotools/build_asm.sh
D native/android/driver/libadrenotools/gen/bcenabler_patch.h
D native/android/driver/libadrenotools/include/adrenotools/bcenabler.h
D native/android/driver/libadrenotools/src/bcenabler.cpp
D native/android/driver/libadrenotools/src/bcenabler_patch.s
D native/android/driver/libadrenotools/tools/ADPKG.md
D native/android/driver/libadrenotools/tools/README.md
D native/android/driver/libadrenotools/tools/acc-shim/README.md
D native/android/driver/libadrenotools/tools/acc-shim/vk_acc_shim.cpp
D native/android/driver/libadrenotools/tools/blob-patcher.py
D native/android/driver/libadrenotools/tools/qtimapper-shim/.clang-format
D native/android/driver/libadrenotools/tools/qtimapper-shim/Android.bp
D native/android/driver/libadrenotools/tools/qtimapper-shim/README.md
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/QtiGrallocDefs.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/common.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_adreno_info.cpp
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_adreno_info.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_priv_handle.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_utils.cpp
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gr_utils.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/gralloc_priv.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/mapper.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/mapperextensions.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/types/common.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/types/mapper.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/ext/types/mapperextensions.h
D native/android/driver/libadrenotools/tools/qtimapper-shim/shim.cpp
```
