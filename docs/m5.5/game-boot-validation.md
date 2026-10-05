# M5.5 — Game boot validation

## Status

**PASS — picker-to-DVD attachment and game title boot path validated on the Retroid Pocket 5.** A user manually selected an Xbox XISO through Android's Storage Access Framework. The exact open document was attached to the Xbox IDE DVD before guest execution, and the selected title's “Press Start to Begin” screen was physically displayed. Full gameplay and later display stability are outside this milestone; later captures in this run were black while the process and presentation callbacks remained active.

## Android app and selection flow

- Package: `org.boxdroid.m55`; launcher label: **BoxDroid M5.5**.
- The Activity extends the existing performance/runtime Activity for shared presentation, but overrides the presenter-ready hook so the default HDD-only autostart is suppressed.
- Once the display presenter is ready, the Activity presents `ACTION_OPEN_DOCUMENT` for one openable document. It does not scan storage. MIME hints are only picker guidance; the selected document is validated through its open descriptor rather than an extension.
- Cancellation, null selection, provider errors, empty documents, and non-random-access descriptors leave the app idle and permit another selection. None starts QEMU.
- Selection diagnostics record the returned `content://` URI, provider display name, MIME type, provider-reported size, descriptor size, read checks, descriptor, and persistence-permission result. The URI is logged once on selection and is not converted into a guessed filesystem path.

## Descriptor ownership and Xemu DVD attachment

Android opens the selected URI with `ContentResolver.openFileDescriptor(uri, "r")`. The Activity retains the `ParcelFileDescriptor` through guest shutdown. It takes a persistable read grant when Android offers one, then releases that grant during cleanup.

The native M5.5 entry point validates the descriptor with `fstat` plus first-byte and last-byte `pread` checks. It duplicates the selected FD to a descriptor number above stderr with close-on-exec cleared, then passes that duplicate through pinned QEMU's existing `-add-fd fd=N,set=55` facility. QEMU owns the duplicate during early option processing, copies it into fdset 55, and closes the transferred input FD. The existing Xbox IDE DVD path is configured as:

```text
-drive file=/dev/fdset/55,if=ide,index=1,media=cdrom,format=raw
```

This is the existing QEMU/Xemu drive mechanism used for the Xbox virtual DVD; no image copy, URI-to-path conversion, second disc subsystem, or game-path fallback is used. After `qemu_init()` creates the block backend, M5.5 verifies that IDE index 1 is inserted and its length matches the selected descriptor size. If that check fails, QEMU is cleaned up before the guest main loop begins.

The Activity-owned `ParcelFileDescriptor` remains open for the runtime lifetime and is closed only after QEMU/APU shutdown. The native duplicate is owned by QEMU's `-add-fd`/fdset lifecycle. No ADB or shell access is used at runtime.

## Observable startup ordering

Expected bounded markers:

```text
M55_STATE_IDLE / M55_EMULATOR_NOT_STARTED
M55_PICKER_LAUNCHED
M55_URI_SELECTED
M55_URI_VALIDATED
M55_EMULATOR_START_REQUEST
M55_DVD_ATTACHED
M55_GAME_BOOT_ATTEMPT / M55_MCPX_BIOS_START
```

The launcher and surface callbacks do not call the standard `startXbox()` path in M5.5. The only M5.5 call to `startXboxWithDvd()` occurs after a successful picker result, descriptor validation, and presenter readiness. `nativeXboxStart()` rejects startup in an M5.5 build unless the validated DVD descriptor is present. Device evidence is still pending the user's manual selection.

## Build and device validation

The dedicated script `scripts/m5.5-game-boot-android.sh` cleanly reconstructed and built the arm64 Android runtime against pinned Xemu `478b4f496102379c7eaa7f3ec10e714a703c4300`, built and installed the separate APK, and staged only the explicitly supplied BIOS/MCPX/HDD inputs into M5.5's package-private external files directory. APK badging confirmed `org.boxdroid.m55`, label **BoxDroid M5.5**, target SDK 33, and `arm64-v8a`; APK v2 signature verification passed, and `libboxdroid.so` was ELF64/AArch64. `git diff --check` and `bash -n scripts/m5.5-game-boot-android.sh` passed.

### Preselection proof

- Idle-only picker check, PID `18896`, logged `M55_STATE_IDLE` and `M55_EMULATOR_NOT_STARTED`.
- The selected-image run, PID `20570`, independently logged the same idle state before `M55_PRESENTER_READY` and `M55_PICKER_LAUNCHED action=ACTION_OPEN_DOCUMENT`.
- The captured Android UI was the system Documents picker. No QEMU init, MCPX/BIOS start, or guest main-loop marker appeared before selection.
- M5, M5.2, M5.3, M5.4, M6, and M5.5 package IDs were all installed concurrently after M5.5 installation.

### User-selected image and boot result

- Selection came directly from the user in the picker; no storage scan or path lookup occurred.
- Display name: `Tom Clancy's Splinter Cell - Pandora Tomorrow (USA, Europe) (En,Fr,De,Es,It).xiso`.
- Selected-image run PID: `20570`.
- Returned URI used the `content://com.android.externalstorage.documents/document/` scheme. The complete returned URI is retained in the ignored device log under `build/m5.5/results/`; the app did not convert it to a guessed path.
- Provider MIME: `application/octet-stream`; provider size and descriptor size both reported `3,115,581,440` bytes.
- The opened descriptor passed `fstat`, a first-byte read, and a last-byte random-access read. Persistable read permission was taken. Activity retained `ParcelFileDescriptor` FD 86 for the runtime; native code duplicated it and QEMU's `-add-fd` path owned that duplicate.
- Ordering was observed as `M55_URI_SELECTED` → `M55_URI_VALIDATED` → `M55_DVD_ATTACH_REQUEST` → `M55_EMULATOR_START_REQUEST` → `M55_URI_FD_VALIDATED` → `XBOX_INIT_BEGIN` → `M55_DVD_ATTACHED drive=ide,index=1 bytes=3115581440` → `M55_GAME_BOOT_ATTEMPT` / `M55_MCPX_BIOS_START` → `XBOX_MAIN_LOOP_START`.
- QEMU queried IDE index 1 after initialization and verified it was inserted with a byte length exactly matching the selected document. The Xbox main loop did not start unless that verification succeeded.
- A physical capture about five seconds after guest start showed the selected game's title screen, including **“Press Start to Begin.”** This confirms the selected disc reached the title executable path. No controller input or gameplay validation was performed.
- Later captures at approximately 13 and 25 seconds were black. The process remained alive and periodic Vulkan `FRAME presented` records continued; sampled NV2A output hashes alternated between black and nonblack content. This run did not establish the cause of those later black frames.
- Periodic `FRAME presented` diagnostics reached 5,430; the captured log contained no present-failure or WSI-failure marker. A final Vulkan diagnostics JSON was unavailable because shutdown was forced.
- The app was sent to the background by Android Back. M5.5 intentionally preserves QEMU across `onStop`, so no graceful QEMU shutdown marker was produced. The operator then force-stopped the app for device cleanup. The crash buffer was empty; this is not recorded as a graceful emulator shutdown.

## Scope and milestone protection

This milestone does not modify M6 audio behavior, Xemu's upstream pin, guest boot policy, BIOS, MCPX, HDD contents, or the rejected untracked M5.4 x87 candidate. M5, M5.1, M5.2, and M6 remain PASS; M5.3 remains frozen PARTIAL and M5.4 remains PARTIAL. M7 has not started.

## M5.5 exit criteria

**PASS.** The user-selected XISO was opened through SAF, validated by descriptor reads, attached to QEMU's existing Xbox DVD at IDE index 1 before `qemu_main_loop()`, and reached its game title screen on the Retroid. No guessed or fallback image was used. The later black captures and forced app termination are recorded limitations; neither changes the demonstrated picker → selected FD → Xbox DVD → game title boot chain. Full gameplay, controller support, and a graceful shutdown path are not claimed by M5.5.
