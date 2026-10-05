# M6.1 — Game boot and native audio integration

## Status

**PASS** for the picker-to-Xbox-DVD-to-title path with M6 native audio on the Retroid Pocket 5. Gameplay compatibility is outside this milestone. No M7 work was started.

## Baseline and integration

M6.1 uses the M6 PASS checkpoint `482c18f99ccb4955891220bb4a5cc9916c321975` as its application/audio baseline and ports the picker/DVD flow validated by M5.5 at `57bdc618f171b757d305703fee1a85b643ede6f3`. It is an isolated `org.boxdroid.m61` application built from the M6 Android/audio sources plus the shared M5 presentation/runtime sources. Its native build retains the pinned M6 AAudio bridge and enables the already validated M5.5 deferred-start and selected-DVD runtime path. The Xemu input remains pinned at `478b4f496102379c7eaa7f3ec10e714a703c4300`; active patches 0001–0018 were reconstructed in order, including `0018-m6-audio-android.patch`.

The M6 audio path remains:

`Xbox VP → GP/EP DSP → MCPXAPUState.monitor.frame_buf (48 kHz stereo S16) → bounded SPSC ring → AAudio → Android output`

`audio.volume_limit = 1.0` is preserved. The AAudio callback remains lock-free, allocation-free, and free of logging, JNI, and host I/O. No audio mixer or resampler was added. `M6Activity` was made non-final only so the separate M6.1 activity can inherit M6 focus, foreground/background, overlay, and audio shutdown behavior.

## Startup and picker

The M6.1 activity and display presenter initialize while the Xbox runtime is stopped. The fresh launch logged `M61_STATE_IDLE emulator=stopped mcpx=stopped bios=stopped dvd=none`, followed by `M61_PICKER_LAUNCHED action=ACTION_OPEN_DOCUMENT`. Before a selection, there was no AAudio initialization, APU attachment, QEMU initialization, DVD, MCPX/BIOS, or guest main loop.

The app uses the Android Storage Access Framework with a single-document `ACTION_OPEN_DOCUMENT` request. It does not scan storage or derive a path. Cancel or invalid access leaves the emulator stopped and allows another picker attempt. The user manually selected **Tom Clancy's Splinter Cell - Pandora Tomorrow (USA, Europe) (En,Fr,De,Es,It).xiso**. Android returned a `content://` document URI; the provider reported `application/octet-stream` and 3,115,581,440 bytes. The opened descriptor reported the same size, and both first-byte and last-byte `pread` checks succeeded (`read=1 random_access=1`).

The activity retains its `ParcelFileDescriptor` until native runtime shutdown. Native code independently verifies the FD and size, duplicates the descriptor, clears close-on-exec for QEMU, and transfers the duplicate through `QEMU_add-fd` set 55. QEMU owns that duplicate after initialization; the Activity-owned descriptor remains open while the guest uses the disc and is closed only after QEMU/APU shutdown.

## DVD attachment and game boot

The existing QEMU Xbox IDE DVD path is used:

`selected FD → QEMU fdset 55 → file=/dev/fdset/55,if=ide,index=1,media=cdrom,format=raw`

The ordered device log recorded `M61_URI_VALIDATED`, `M61_DVD_ATTACH_REQUEST`, `M55_URI_FD_VALIDATED` (size 3,115,581,440; first/last reads succeeded), `M55_QEMU_DVD_CONFIG`, and `M55_DVD_ATTACHED` (`ide,index=1`, inserted, matching size). Only after attachment did the log record `M55_MCPX_BIOS_START`, `XBOX_MAIN_LOOP_START`, and `M61_GAME_BOOT_ATTEMPT start_result=0 dvd_selected=1`. The user saw the selected title's **“Press Start to Begin”** screen. No bundled or guessed image path was used.

## Audio and lifecycle validation

After selecting the image and starting the guest, AAudio opened at 48,000 Hz, stereo, S16LE, with a 192-frame device burst, 384-frame active buffer, 1,536-frame capacity, and 64–192-frame callback blocks. The observed queued estimate was approximately 16–17 ms.

On the final run (PID 28817), the closing AAudio counters were:

- offered: 16,884,224 frames
- nonzero guest/source frames: 11,170,781; peak 17,152
- nonzero frames consumed by AAudio: 11,170,781; peak 17,152
- callbacks: 95,045
- underruns: 214 callbacks / 30,080 frames
- ring overruns: 0
- dropped frames: 65,536

The dropped samples were intentional mute/discard behavior while backgrounded or without foreground/focus; they were not ring overruns. The user confirmed the game and audio were present after returning from the background. The user also reported that the audio was clear and the title screen was visible. No stale playback or broken resume was reported.

An initial lifecycle trial exposed a duplicate Activity problem: relaunching from the launcher created another M6.1 Activity with no selected-document state. The M6.1 manifest now uses `singleTask`. On the fresh post-fix run, Home and launcher re-entry retained PID 28817 and one M61Activity; it did not launch a second picker or lose the selected game. The same guest/audio stream continued, and audio/video were present after resume.

Explicit Back then stopped QEMU cleanly (`XBOX_QEMU_LOOP_RETURN status=0`, `XBOX_STOP_RESULT=0`), shut down AAudio after QEMU/APU cleanup, and closed the retained document descriptor. Final AAudio shutdown reported no overrun. The Android crash buffer was empty.

## Presentation and build validation

The run recorded 15,207 successful acquires and submissions, 15,206 successful presents, and zero failed presents. After Android returned the activity to the foreground, the selected game's video was visible and continued presenting. One `VK_ERROR_SURFACE_LOST_KHR` recovery attempt returned `VK_RESULT_OTHER`; Android then supplied a new SurfaceView generation and presentation continued. At shutdown, the generic presenter summary reported `status=FAIL`: this picker-first run had zero guest frames in generation 1 before the lifecycle recreation (`frame_before_recreation=0`), despite 15,206 post-recreation presents. The summary also retained `surface_lost=1` and the failed in-place recovery as `last_error`. This lifecycle diagnostic caveat is recorded rather than described as a clean presenter PASS.

The clean native reconstruction used the pinned Xemu source and ordered patch series. The M6.1 APK was built at `build/m6.1/BoxDroid-M6.1-arm64-v8a.apk`; package identity is `org.boxdroid.m61`, label **BoxDroid M6.1**, target API 33, ABI arm64-v8a. APK signature and native AArch64 library checks passed. M5, M5.2, M5.3, M5.4, M5.5, M6, and M6.1 remained separately installed.

## Scope and limitations

M6.1 proves picker-only selection, retained FD access, DVD attachment before guest startup, a genuine selected-game title boot, and audible guest PCM through the M6 AAudio path. It does not claim gameplay compatibility or make changes to M6 audio semantics. No M7 work was started. The transient surface-recovery diagnostic described above is the remaining presentation caveat; it did not prevent the resumed title from being displayed or audio from resuming.
