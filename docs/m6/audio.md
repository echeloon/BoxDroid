# M6 — Audio

## Status

**PASS.** The isolated `org.boxdroid.m6` / **BoxDroid M6** application delivers real Xbox guest PCM through AAudio, and three fresh Retroid launches verified nonzero samples at the source, ring, and AAudio output. The user personally listened on the Retroid Pocket 5 and confirmed the guest audio was clearly audible and sounded correct, with no obvious crackling, distortion, or severe audio/video desynchronization. Background/resume did not produce stale or broken audio. This closes the remaining subjective validation requirement.

## Existing audio architecture

The pinned Xbox APU does not send its output through QEMU's generic `AUD_*` mixer. `hw/xbox/mcpx/apu/vp/vp.c` processes guest voices into mixbins; `hw/xbox/mcpx/apu/dsp/gp_ep.c` runs the GP/EP DSP; `mcpx_apu_monitor_frame()` in `hw/xbox/mcpx/apu/monitor.c` is desktop Xemu's host-output tap. Desktop sends `monitor.frame_buf` directly to `SDL_PutAudioStreamData()` as 48 kHz stereo S16.

`monitor.frame_buf` is host-selected output, not a buffer requiring a guest debug-monitor enable. With `MCPX_APU_DEBUG_MON_GP_OR_EP`, `mcpx_apu_dsp_frame()` collects GP output from DSP X memory at `0x1400`/`0x1420` when EP is disabled, converting its 24-bit samples to S16. When EP is enabled, `ep_fifo_rw()` sends output FIFO 0 through `ep_sink_samples()`, which copies the final PCM into the same monitor buffer. The separate VP monitor is a diagnostic mix of voices and is not selected by M6. The existing GP/EP selection and DSP interpreter remain unchanged.

The Android build disables SDL and historically cleared this buffer without a host sink. Active patch `0018-m6-audio-android.patch` connects the same desktop output point to AAudio. Generic QEMU audio voices/drivers are not part of this Xbox output path.

## Root cause and fix

The source tap was correct. `native/android/m5/boxdroid-xbox-settings.c` supplied a partial C initializer for `g_config.audio` but omitted `volume_limit`, leaving it at **0**. Desktop `config_spec.yml` defaults this field to **1**. The M6 monitor applies `pow(clamp(volume_limit, 0, 1), M_E)`, so the omitted setting produced zero gain.

The old `nonzero_frames` counter examined only accepted samples **after gain**. Earlier runs reported 592,384, 625,408, and 621,568 offered frames with zero nonzero frames; those measurements established muted bridge output, not silent GP/EP source PCM. The earlier conclusion that no audible guest workload was available was therefore unsupported.

The fix initializes `volume_limit = 1.0` only under `BOXDROID_M6_AUDIO`, restoring the desktop default for M6. Earlier apps keep their existing configuration. No DSP, guest workload, firmware, timing, renderer, mixer, resampler, or audio-backend substitution was needed. The existing BIOS boot sequence itself produces nonzero guest audio with this fix.

The native settings source is copied into the clean reconstructed tree by the existing build script. Patch 0018 and the ordered active series remain unchanged and reproducible; the unrelated rejected `0018-m54-tb-local-x87.patch` remains outside the series.

## Backend and data path

`Xbox VP voices → GP/EP DSP → 256-frame stereo S16 monitor chunk → configured volume gain (unity by default) → fixed 2048-frame SPSC ring → AAudio callback → Android audio service → output route`.

AAudio fits the existing native Android Activity/JNI runtime. Adding SDL's Android platform ownership would duplicate integration. M6 adds no second mixer or application resampler. It requests shared 48 kHz stereo S16; unsupported negotiation reports an error instead of silently using an incompatible rate/layout.

Each guest monitor chunk spans 5.33 ms. The existing APU deadline and all guest timing remain unchanged. The 2048-frame ring caps buffering at 42.7 ms. The producer never waits; excess newest frames are dropped with overrun/drop counts. The callback zero-fills shortages and consumes available PCM. Its underrun count requires source activity within the preceding 32 callbacks, excluding initial startup and prolonged idle source periods. The active AAudio buffer targets two device bursts, bounded by the reported device capacity.

## Threading and lifecycle

- **Producer:** `mcpx.apu_thread`, under the APU's own lock, performs bounded PCM copies and atomics; it does not hold QEMU BQL while pushing PCM.
- **Consumer:** the AAudio callback uses the fixed ring and atomics. It takes no locks, allocates nothing, and performs no logging, JNI, filesystem access, or blocking host I/O.
- **Focus/pause:** `M6Activity` updates atomic focus/foreground state. Muted callbacks output silence; production is discarded while muted. Restoration flushes stale queued samples before resuming the same stream. Ordinary backgrounding preserves the guest/APU instance.
- **Initialization/teardown:** the serialized native executor opens AAudio before starting QEMU. Shutdown joins QEMU/APU before stopping and closing AAudio, followed by presenter shutdown. Earlier Activity subclasses retain their original stop-on-background default.

## Diagnostics

Counters now distinguish raw source frames/peak before gain or mute, accepted nonzero ring frames/peak after gain, and consumed frames/nonzero frames/peak copied into AAudio output. Thus a gain or mute policy cannot be mistaken for a silent source. Peak is absolute S16 magnitude, up to 32768.

The existing initialization, focus/lifecycle, 10-second aggregate, and final shutdown logs report rate, format, burst/buffer/capacity, callback sizes, queue estimates, underruns, overruns, dropped frames, source/ring/consumer PCM counts, peaks, and errors. A single producer log reports the selected GP/EP output and gain. Callback counters are updated once per block, and peak/nonzero checks share the bounded copy loop; no real-time callback logs were added. The existing Android audio overlay remains unchanged.

## Clean build and device validation

A new clean native work root reconstructed pinned Xemu `478b4f496102379c7eaa7f3ec10e714a703c4300` with ordered patches 0001–0018 and built `libboxdroid.so` as ELF64/AArch64. A clean Gradle `clean assembleDebug` executed all 36 tasks. APK v2 signature verification, package `org.boxdroid.m6`, API 33 target, and separate installation succeeded. Artifact: `build/m6/BoxDroid-M6-arm64-v8a.apk`.

All three fresh launches negotiated 48,000 Hz stereo S16LE, 192-frame burst, 384-frame active buffer (8 ms), and 1536-frame capacity (32 ms). Callback blocks were 64–192 frames. Observed queue estimates stayed about 8–22 ms; these are exposed-buffer estimates, not acoustic latency measurements.

| Run / PID | Offered frames | Raw source nonzero | Ring nonzero | AAudio consumed nonzero | Source / ring / consumer peak | Acquire / submit / present | Underrun callbacks / frames | Overruns / drops |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Background/resume / 10905 | 593,664 | 549,551 | 484,527 | 484,463 | 10,755 / 10,755 / 10,755 | 438 / 438 / 438 | 57 / 8,448 | 0 / 65,024 |
| Normal / 11129 | 619,008 | 577,204 | 577,204 | 577,204 | 9,849 / 9,849 / 9,849 | 511 / 511 / 511 | 84 / 13,632 | 0 / 0 |
| Normal / 11306 | 615,680 | 574,038 | 574,038 | 574,038 | 10,170 / 10,170 / 10,170 | 514 / 514 / 514 | 78 / 12,416 | 0 / 0 |

All three showed the genuine green animation, Xbox logo, and dashboard prompt in landscape, with preserved 4:3 aspect fit and black borders. Failed presents were zero; QEMU stop returned 0; AAudio closed cleanly; crash buffers were empty. The first run intentionally discarded production during background/focus loss and recreated its surface on return. Its ring-versus-consumer nonzero difference was 64 frames; this lifecycle test flushes queued data, and its overrun counter remained zero.

Green-phase unique-FPS samples were 20.6/20.0, 18.7/20.0, and 19.7/19.2, respectively. Animated-phase total-capacity CPU was 25–29% and GPU busy was 11–20%. Corresponding green-phase presenter increments were approximately 19.5–20/s. This remains consistent with the retained M5.4/M6 baseline; the comparison is not a paired performance benchmark. No major video/timing regression was observed.

An additional active-audio focus test (PID **13029**) backgrounded at about 10.8 seconds and resumed after one second. The same PID and a single AAudio initialization were retained. Consumed nonzero frames increased from **428,852 before pause** to **516,530 after resume**; the final source count was 552,114 with peak 9,318. Muted production discarded 35,328 frames; overrun count remained zero. Shutdown and crash checks passed. This establishes resumed nonzero PCM delivery, beyond merely resuming silent callbacks.

## Physical output and listening validation

A temporary separate microphone helper recorded the built-in microphone (`UNPROCESSED`, 48 kHz mono, routed device type 15) during a further M6 boot (PID **11994**). The helper generated no sound, requested no playback focus, left M6's audio path unchanged, and was removed after capture. M6 supplied 607,232 frames, of which 566,704 were nonzero at source, ring, and AAudio consumption, with peak 11,289. AudioFlinger selected the speaker output, with media volume unmuted. No non-guest playback was injected.

The recording contains 1,533,952 microphone samples, peak 15,604 and overall RMS 1,253. One-second RMS was about 745–772 in quiet sections, rose to 1,323/1,569/2,041/2,983 during boot, and returned to about 766 afterward. Evidence: `build/m6/audio-fix-validation/acoustic/speakers.wav` and its capture/log files. This supplies acoustic evidence in addition to digital PCM counters; it does not measure acoustic latency.

The user personally listened to the Retroid Pocket 5 during the M6 run and confirmed that real Xbox guest audio was audible from the device speakers, playback sounded correct, and there was no obvious crackling, distortion, or severe A/V desynchronization. The user also confirmed that background/resume did not produce stale or broken audio. This is subjective device listening validation; acoustic latency was not separately measured.

## Regression and milestone protection

The installed M5, M5.2, M5.3, M5.4, and M6 packages coexist. After the audio fix, M5.2 PID **12606** showed its original four-line overlay and dashboard, completed **319/319** successful presents with zero failures, returned QEMU stop result 0, and had an empty crash buffer. Its recreation diagnostic FAIL reflects that this ordinary regression launch did not exercise M4's required recreation sequence.

M5, M5.1, M5.2, and M6 are PASS. M5.3 remains frozen PARTIAL; M5.4 remains PARTIAL. M7 and the XISO/game-picker milestone have not started. No changes were committed or pushed.

## Known limits and exit criteria

- This sink consumes Xemu's existing Xbox APU output; it adds neither generic QEMU host-audio support nor optional USB/AC'97 host devices.
- Routes unable to provide 48 kHz stereo S16 report an error; no fallback resampler was added.
- Buffer estimates are not measured speaker latency. Short underruns remain counted; the listening review found no obvious crackling or broken playback, and zero ring overruns do not prove perfect sound quality.
- M6 PASS criteria are met: real guest PCM reaches AAudio and is audible, focus/pause recovery works, buffering is bounded, teardown is clean, and no major visual/timing regression was observed. The listener reported no obvious severe A/V desynchronization; acoustic latency was not measured instrumentally.
