# M6 — Audio

## Status

**PARTIAL.** M6 is isolated in `org.boxdroid.m6` / **BoxDroid M6**. The AAudio path, lifecycle recovery, and clean teardown were validated on the Retroid Pocket 5. M6 cannot pass yet because the available BIOS/dashboard workload produced no non-silent guest PCM, so audible Xbox playback could not be confirmed.

## Existing audio architecture

The pinned Xbox APU does not send its output through QEMU's generic `AUD_*` mixer. `hw/xbox/mcpx/apu/vp/vp.c` mixes guest voices; `hw/xbox/mcpx/apu/dsp/gp_ep.c` processes the real-time DSP and writes the selected monitor point into `MCPXAPUState.monitor.frame_buf`; `mcpx_apu_monitor_frame()` in `hw/xbox/mcpx/apu/monitor.c` is the existing host-output tap.

Desktop Xemu opens an SDL3 `SDL_AudioStream` in that monitor, requests 48 kHz stereo S16, and lets SDL convert to the output device format/rate. The Android cross-build deliberately disables SDL, and the M5 downstream patch retains the guest APU/DSP while clearing the monitor buffer instead of opening a host device. Thus Android previously discarded the APU monitor samples before they reached a host backend. The QEMU audio drivers under `audio/` are not connected to this Xbox APU monitor.

## Backend decision

M6 uses Android NDK AAudio directly from the existing APU monitor tap. The M6 application is a native Android `Activity` with its own `SurfaceView` and JNI runtime, not an SDL Android activity; SDL is disabled in the current build and adding SDL's Android activity/audio lifecycle would duplicate platform ownership. AAudio provides a native Android callback and device-selected burst/buffer properties while preserving the APU's established sample source and format. The bridge adds no second mixer and no application-side resampler. It requests a shared 48 kHz, stereo, PCM S16 output stream; if Android cannot provide that format, initialization reports an error rather than silently playing at the wrong rate or channel layout.

## Data path and buffering

`Xbox VP voices → GP/EP DSP → 256-frame stereo S16 monitor chunk → fixed 2048-frame SPSC ring → AAudio data callback → Android audio service → selected output route`.

Each APU monitor chunk is 256 stereo frames, equivalent to 5.33 ms at 48 kHz. The APU's existing 5.33 ms frame deadline remains enabled. M6 changes only the Android host sink; it does not change Xbox guest timing or APU DSP selection. APU samples are not synthesized: the bridge receives only the current guest APU monitor buffer and applies the same configured volume-limit gain used by the SDL monitor.

The ring has 2048 stereo frames (42.7 ms at 48 kHz). The producer writes without waiting; if full, it drops the newest excess frames and increments bounded overrun/drop counters. The AAudio callback zero-fills its requested output, copies available frames, and returns immediately. A short callback is counted as an underrun only while the APU has submitted a chunk within the previous 32 callbacks; this excludes startup and intentionally inactive source periods. The AAudio stream requests low-latency shared mode and sets its buffer target to two device bursts, capped by the device-reported capacity. Reported queued duration is an estimate from the app ring plus configured AAudio stream buffer; it is not a hardware loopback measurement of acoustic latency.

## Threading, locks, and teardown

- **APU producer:** Xemu's `mcpx.apu_thread`, under the APU's own `d->lock`; this path performs bounded copies/atomics only and never waits on audio output. It does not hold the QEMU BQL while pushing PCM.
- **Audio consumer:** AAudio's callback thread; it uses the fixed ring and atomics, with no allocation, logging, BQL, or mutex acquisition.
- **Android lifecycle/focus:** `M6Activity` requests Android audio focus and updates atomic foreground/focus state. Focus loss and Activity pause mute the callback and discard incoming samples. Focus gain clears stale queued data before playback resumes. One AAudio stream stays open across temporary focus/lifecycle transitions. Back-to-exit uses a serialized clean-stop request so QEMU/APU stop first, then AAudio closes, and then the Activity finishes.
- **Initialization:** the stream opens on the app's serialized native executor before `nativeXboxStart()` enters QEMU; no blocking audio-device call runs under BQL.
- **Shutdown:** `nativeXboxStop()` shuts down and joins QEMU/APU first; only then does the same native executor stop and close AAudio. This prevents a callback or APU producer from using destroyed state.

Ordinary backgrounding in the M6 Activity keeps the current guest/APU instance alive, while host output is muted and incoming chunks are discarded. Returning to foreground requests focus again and resumes the same stream after flushing stale data. Earlier apps retain their existing default behavior of stopping QEMU on Activity stop.

## Diagnostics

The native bridge records bounded counters for APU frames offered/nonzero, AAudio callback count/block sizes, underrun callbacks/frames, overrun blocks, dropped and muted frames, queue depth, device rate/channels/format, burst size, stream buffer/capacity, focus/foreground state, and stream errors. It logs stream initialization once, focus/lifecycle state transitions, aggregate statistics at a 10-second cadence, and a final summary at shutdown. The M6 Android overlay appends audio state, underruns/drops, and estimated queued milliseconds to the existing FPS/RAM/CPU/GPU lines. `AUDIO: RUNNING` means the AAudio stream is started and the Activity is foregrounded with focus; it does not assert that the guest is producing nonzero samples. No logging occurs from the real-time audio callback.

## Retroid validation

The clean Android build reconstructed the pinned Xemu source with ordered patches `0001` through `0018`, built the Android AArch64 native library, assembled `build/m6/BoxDroid-M6-arm64-v8a.apk`, and installed it as a separate package (`org.boxdroid.m6`, label **BoxDroid M6**). The final underrun-counter and clean-exit changes were rebuilt and reinstalled before these three final runs.

Device: Retroid Pocket 5, Android API 33, arm64-v8a. All runs initialized the Xbox machine (`XBOX_INIT_RESULT=0`) and AAudio (`AAUDIO_INITIALIZE result=0`). Device output was 48,000 Hz, stereo, signed 16-bit PCM. AAudio reported a 192-frame burst, a 384-frame stream buffer (8 ms), and 1536-frame capacity (32 ms); callback requests ranged from 64 to 192 frames (1.3–4 ms). The application ring holds at most 42.7 ms. Observed queued-duration estimates were about 8–22 ms; these values are queue estimates, not measured acoustic latency.

| Fresh run | PID | Green-phase unique guest FPS samples | Green-phase present rate | Successful acquire / submit / present | Failed presents | APU offered / nonzero frames | Underruns / overrun blocks / dropped frames | Shutdown / crash buffer |
|---|---:|---:|---:|---:|---:|---:|---:|---|
| 1, with Home/background and return | 26774 | 20.8, 20.0 | about 20/s | 436 / 436 / 436 | 0 | 592,384 / 0 | 43 callbacks, 6,848 frames / 0 / 58,112 | `XBOX_STOP_RESULT=0`, AAudio closed, 0 bytes |
| 2 | 27018 | 18.4, 20.0 | about 20/s | 514 / 514 / 514 | 0 | 625,408 / 0 | 78 callbacks, 12,608 frames / 0 / 0 | `XBOX_STOP_RESULT=0`, AAudio closed, 0 bytes |
| 3 | 27180 | 20.4, 20.0 | about 20/s | 520 / 520 / 520 | 0 | 621,568 / 0 | 85 callbacks, 13,376 frames / 0 / 0 | `XBOX_STOP_RESULT=0`, AAudio closed, 0 bytes |

Guest unique FPS is read from the M5.3 unique-frame sampler, while the present-rate estimate is derived from its cumulative presenter count over the animated interval. These values remain in the M5.4 range and show no major visual/timing regression from enabling the host audio sink; the comparison is not a paired benchmark. Animated-phase process CPU was approximately 25–28% of total eight-core capacity and GPU busy was generally 17–20% after startup. The audio callback did not report overruns. The first run muted/dropped input during background/focus loss, then reacquired focus (`AUDIO_FOCUS_REQUEST result=1`) and resumed on the same PID and AAudio stream; the Vulkan surface was recreated, and later dashboard output remained visible. All runs showed the green Xbox animation, Xbox logo, and dashboard prompt in landscape with no failed Vulkan presents. Back-to-exit then recorded QEMU stop result 0, AAudio shutdown completion, and an empty crash buffer.

The installed package list contained all five independent applications: `org.boxdroid.m5`, `org.boxdroid.m52`, `org.boxdroid.m53`, `org.boxdroid.m54`, and `org.boxdroid.m6`. After M6 installation, M5.2 was launched again: its Xbox logo and dashboard prompt appeared, its four-line FPS/RAM/CPU/GPU overlay remained intact, it completed 325/325 successful presents with zero failures, and it shut down cleanly. Its M4 recreation diagnostic reports FAIL because this M5.2 check did not perform the M4-required recreation sequence; the M6 run itself did recreate the surface during background/resume.

Across the three final M6 runs, the APU bridge offered 592,384–625,408 frames, but **zero offered frames contained a nonzero sample**. Therefore these runs establish that the APU monitor is connected to a live AAudio output stream and that focus, buffering, surface recreation, and teardown paths operate. They do not establish that audible guest sound reached the speakers/headphones, nor can they assess crackle or subjective latency. No known audible guest workload was available in the current BIOS/dashboard setup; no game image or synthetic tone was introduced. M6 remains **PARTIAL** pending a legal, existing guest workload that emits non-silent PCM and direct audible validation.

## Known limits

- This bridge consumes the existing Xbox APU monitor output; it does not add generic QEMU host-audio support or the optional Xbox USB/AC'97 peripherals.
- Android shared-mode AAudio latency values are estimates from exposed app/device buffers, not acoustic round-trip measurements.
- M6 currently targets AAudio's standard 48 kHz stereo S16 stream. A device/route that cannot provide that stream reports an initialization error; no fallback resampler is added.
- The current BIOS/dashboard produced only silent PCM in the measured monitor stream. M6 cannot be marked PASS from callbacks/counters alone; it still needs a non-silent guest workload and audible validation, followed by listening checks for systematic crackle and latency.
