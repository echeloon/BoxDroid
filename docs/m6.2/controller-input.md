# M6.2 — Native Android physical controller input

Status: **PASS**

M6.2 builds on the M6.1 PASS checkpoint (`b208f3a38334374ca228efe19006a83f2fe3c7d5`). It keeps the picker-gated game startup and native AAudio implementation, and adds Android physical gamepad input for the existing emulated Xbox XID controller.

## Architecture

The M6.2 Activity subclasses `org.boxdroid.m61.M61Activity`, which in turn uses the M6 Activity/runtime. The existing `singleTask`, `ACTION_OPEN_DOCUMENT`, retained selected-document descriptor, QEMU fdset/DVD setup, deferred Xbox startup, Vulkan presentation, and AAudio lifecycle remain in that chain.

`M62Input` registers an Android `InputManager.InputDeviceListener` and handles `KeyEvent` and `MotionEvent` from non-virtual devices exposing Android `SOURCE_GAMEPAD`, `SOURCE_JOYSTICK`, or `SOURCE_DPAD`. It stores the latest state in one of four fixed host slots. The first connected controller is the default primary; a controller producing an input event becomes primary. Input is not buffered in a per-event queue.

The Android adapter calls a small JNI bridge in `native/android/m62/boxdroid-m62-input.c`. The bridge clamps and snapshots the canonical state. A short mutex protects writes and snapshots. Xemu calls `boxdroid_m62_input_snapshot_primary()` from the existing Xbox XID `update_input()` boundary. That poll uses `pthread_mutex_trylock()` because USB polling runs under QEMU's BQL; if the state lock is momentarily busy, the current XID report is retained until the next poll. No Android input callback blocks the guest thread waiting for Java or a device.

The M6.2 runtime adds Xemu's existing `usb-xbox-gamepad` to the Xbox USB topology at player-one port 0. The implementation does not add a second controller protocol. The four host slots leave room for future port assignment; this milestone selects one primary device and connects one guest XID pad.

The controller patch is `patches/xemu/0019-m62-android-controller-input.patch`, after the active M6 audio patch 0018. It updates Xemu's existing `hw/xbox/xid.c` Android `update_input()` path and adds an opt-in Meson option. It does not change the Xemu submodule pin.

## Xbox guest report and default mapping

The Xemu `USBXIDGamepadState` report in `hw/xbox/xid.h` contains eight analog pressure bytes, a digital `wButtons` bitset, and four signed 16-bit stick axes. M6.2 converts canonical Android state at this XID boundary:

| Android host control | Xbox XID guest state |
| --- | --- |
| A / B / X / Y | Corresponding analog pressure byte, 0 released or 255 pressed |
| Left stick X/Y | `sThumbLX` / `sThumbLY` |
| Right stick X/Y | `sThumbRX` / `sThumbRY` |
| L3 / R3 | Left/right thumb bits in `wButtons` |
| D-pad up/down/left/right | Corresponding D-pad bits in `wButtons` |
| LT / RT | Left/right analog trigger pressure byte, 0–255 |
| LB / RB | Xbox White / Black pressure byte, 0 or 255 |
| Start/Menu | Start bit in `wButtons` |
| Back/View | Back bit in `wButtons` |

Digital host face buttons use the full pressure value expected by XID; M6.2 does not synthesize intermediate face-button pressure. Trigger pressure is derived from analog host trigger values. Android's system Back key is left to Android when it comes from the virtual/system device; a physical gamepad Back/View event is consumed by M6.2 and sent to the guest. Android's Guide/Mode key has no Xbox guest equivalent and is consumed without mapping.

## Android axes, normalization, and deadzone

The adapter looks up each `MotionRange` on the current `InputDevice`, including its minimum, maximum, midpoint, and `flat` value. Left stick uses `AXIS_X/Y`; right stick prefers `AXIS_RX/RY` and falls back to `AXIS_Z/RZ`. Triggers prefer `AXIS_LTRIGGER/RTRIGGER` and fall back to `AXIS_BRAKE/GAS`. `AXIS_HAT_X/Y` joins the same D-pad state as the D-pad key events.

Each centered stick axis is normalized using its own negative and positive span around the reported midpoint, then clamped to `[-1, 1]`. Android joystick Y increases down; M6.2 inverts Y so positive canonical and XID Y means up. Each stick pair receives a radial deadzone and remap: values within the larger of the pair's normalized device-reported flat ranges become zero; outside it, the remaining magnitude is remapped to `[0, 1]` while preserving direction and clamping the vector. If Android reports no useful flat range, the fallback is 0.08. There is no temporal smoothing.

Triggers are normalized from their device-reported min/max to `[0, 1]`, with any reported flat range removed. An analog range takes precedence over `KEYCODE_BUTTON_L2/R2`; those keys are used only when the corresponding analog range is absent. This avoids applying analog and digital values twice. The native edge clamps all axes and triggers again before translating them to the guest report.

## Device and lifecycle behavior

The fixed four-slot host state tracks Android `deviceId`, connection state, buttons, sticks, and triggers. Neither vendor/product identifiers, names, nor a Retroid device ID select the mapping. Devices marked virtual or lacking a gamepad/joystick/D-pad source are ignored. `InputManager` add/change/remove notifications register capabilities and clear removed-device state. Disconnect clears all held buttons and axes before releasing the slot; another connected slot may become primary without restarting the guest.

On Activity pause, M6.2 publishes neutral state to all slots and clears the native snapshot to prevent held guest controls. On resume, it enumerates currently connected devices, resets stale state, and accepts new events. Closing the Activity unregisters the listener. These hooks leave M6.1's selected XISO descriptor, running guest, audio stream, and presentation lifecycle to their existing owners.

## Validation

The final clean build used the pinned Xemu source plus active patches through 0019, and included both M6 audio and M6.2 input build options. The resulting package is `org.boxdroid.m62`, label `BoxDroid M6.2`, APK `build/m6.2/BoxDroid-M6.2-arm64-v8a.apk`. The Retroid had M5, M5.2, M5.3, M5.4, M5.5, M6, M6.1, and M6.2 installed concurrently.

On a fresh final launch (PID 11604), logs proved the app was idle with MCPX/BIOS stopped and no DVD before the `ACTION_OPEN_DOCUMENT` picker. The user manually selected the XISO. The game reached its handcuff tutorial/title gameplay state and remained visible. The Android device reported standard joystick ranges including X/Y, Z/RZ, hat, and trigger/brake/gas ranges. Normalized stick motion was delivered; sampled values returned to 0.00 at center. The user confirmed both sticks controlled their intended game functions and reported that the complete requested control set worked: A/B/X/Y, all D-pad directions, both sticks and diagonals, L3/R3, analog LT/RT at released/partial/full, LB/RB, Start, and Back/View. Back/View reached the guest without invoking Android navigation. No unwanted center drift or stuck input was reported.

The user also confirmed background/resume preserved game audio without stale or broken playback. Input neutralization and Android device add/remove/re-enumeration handling are implemented; an additional independent Bluetooth/USB controller model was not qualified separately during this run.

The corrected final run verified the inherited audio bridge was compiled with `BOXDROID_M6_AUDIO=1` and active; the M6 `audio.volume_limit = 1.0` behavior remains in the retained M6 audio patch. AAudio reported 48 kHz, stereo S16LE, 192-frame device burst, 384-frame buffer, and a 1536-frame capacity. At the final sampled interval it had offered 18,518,784 PCM frames, of which 16,291,061 contained non-zero guest PCM; 18,518,208 frames were consumed, including 16,290,485 non-zero frames. Peak source/ring/consumed amplitude was 23,376. It reported 0 overrun blocks and 0 dropped frames, 1,004 underrun callbacks / 122,048 underrun frames, and an estimated queue of 20 ms. The user confirmed Xbox game audio remained audible after background/resume, with no issue reported.

Presentation remained active in the game with a 640x480 guest extent. At orderly shutdown the presenter reported 20,880 successful acquires, submissions, and presents, with 0 failed presents, 0 surface-lost events, FIFO mode, and four swapchain images. Its generic summary said `status=FAIL` because `frame_before_recreation=0`; it also recorded 20,880 frames after recreation. This is the known picker-first initial-surface diagnostic caveat: presentation continued on the new surface and the per-present failure count remained zero. The captured overlay displayed about 6 FPS in this game tutorial; no same-scene M6.1 benchmark was available, so no quantitative before/after performance claim is made.

The user exercised background/resume and confirmed the game and audio remained available afterward. A final Android system Back request produced `XBOX_QEMU_LOOP_RETURN status=0`, `XBOX_QEMU_CLEANUP_COMPLETE`, and `XBOX_STOP_RESULT=0`. `AAUDIO_SHUTDOWN_BEGIN/COMPLETE` followed QEMU/APU cleanup, then the input state was neutralized. The Android crash buffer was empty.

## Build and source checks

- Clean M6.2 work root reconstructed the pinned Xemu source through active patches 0001–0019.
- Native arm64 Xemu and the Android M6.2 APK built successfully.
- APK package identity/signature and arm64 native library were verified by the M6.2 build script.
- `org.boxdroid.m62` manifest uses `singleTask` and the landscape M6.1 game Activity lineage.
- `bash -n scripts/m2-android-arm64.sh scripts/m6.2-controller-android.sh` passed.
- `git diff --check` passed.
- `upstream/xemu` remains pinned at `478b4f496102379c7eaa7f3ec10e714a703c4300`.

## Decision and limitations

M6.2 is **PASS** for Android-standard physical gamepad input on the Retroid Pocket 5, while retaining M6.1 picker-driven game boot and M6 audio. The mapping consumes current device capabilities and Android-standard controls rather than vendor/model identifiers. A separate Bluetooth/USB controller was not independently tested in this validation session; the implementation is structured around Android gamepad/joystick sources and device ranges for those devices as well.
