# Forza Maple Valley Hotlap: DSP writer starvation

On the Retroid Pocket 5, handing the APU frame mutex to queued DSP MMIO
writers removes the severe gameplay collapse. The matched, CPU-sampled
comparison improved settled gameplay from **5.81 FPS / 172.25 ms** to
**28.19 FPS / 35.47 ms**. A repeat without CPU sampling reached
**29.40 FPS / 34.01 ms**. Stable 30 FPS and a complete lap are not established.

## Repository and device

- Branch: `forza-opt`.
- Starting/current commit: `00a9894cc90c5e6cfaf16231958d78e8d03d7f0e`.
- Starting working tree: clean. No commits, merges or pushes were made.
- Device: Retroid Pocket 5, Snapdragon 865 / Adreno 650, Android 13.
- Exact benchmark: **Forza Motorsport → Free Run → Hotlap → Maple Valley**.
  Full Maple Valley Raceway (2.98 mi), Class D, 1999 Honda Civic Si Coupe,
  default assists, automatic transmission, default chase camera.
- Existing profile configuration retained: `profile=1`, `diagnostics=0`,
  four background voice workers, `voice_apu=0`, DSP interpreter,
  `tcg_prime=0`, TCG affinity `ff`.

Previous Time Trial captures were retained as supporting investigation only;
none supplies the benchmark numbers here. Existing instrumentation and the
configured build tree were reused. No Linux build-enablement changes, existing
build-script changes, frontend changes or game-specific code are included.

## Method and results

Each run starts from the verified Hotlap starting grid. Press A, wait through
the countdown, then apply full throttle for 15 seconds without steering. The
same session supplies its pre-race and active windows. Images verify the mode,
track, car and driving. In this setup, the unmodified build could remain near
30 FPS while stationary after the countdown; acceleration reliably exposed
the collapse. The precise trigger is therefore more specific than merely
enabling player control.

The pre window lasts approximately 8.6 seconds, from Start Race through the
countdown and brief stationary transition. Active windows use host time relative
to throttle onset, T. FPS is `(N-1)/(last_flip-first_flip)` from logged
`GUEST_FLIP` timestamps; frame times are intervals between actual guest flips.
Duplicate host presents and the overlay counter are not counted as guest frames.

| Window | Original, 500 Hz sampling | Fixed, 500 Hz sampling | Fixed repeat, no CPU sampling |
| --- | ---: | ---: | ---: |
| Pre/countdown | 29.71 FPS / 33.66 ms | 29.84 FPS / 33.52 ms | 29.76 FPS / 33.60 ms |
| Active T+2…12 s | 9.91 FPS / 100.86 ms | 28.54 FPS / 35.04 ms | 29.38 FPS / 34.04 ms |
| Settled active T+5…15 s | 5.81 FPS / 172.25 ms | 28.19 FPS / 35.47 ms | 29.40 FPS / 34.01 ms |
| Active T+8…18 s | 5.45 FPS / 183.63 ms | 28.08 FPS / 35.61 ms | 29.48 FPS / 33.92 ms |

The original result varies around the reported 7–8 FPS and contains long
stalls. For the settled window, p95 frame time is 669.19 ms originally,
49.48 ms with the sampled fix and 41.68 ms in the unsampled repeat. The matched
sampled comparison is a **4.86× throughput increase / 79.4% frame-time reduction**.
The original APK was reinstalled after the first fixed run and reproduced the
collapse, then the fixed APK was installed again for the final repeat.

CPU captures used simpleperf `cpu-clock`, 500 Hz, stack unwinding, and thread
`schedstat` snapshots. Separate 200 Hz off-CPU captures included blocking
time. No samples were lost; emulator PIDs stayed stable during captures.
The repeat omitted CPU sampling and scheduler polling, retaining existing
frame/audio logs. Sampling overhead and run-to-run variation mean the final
29.4 FPS should not be substituted into the strictly matched A/B comparison.

## Dominant delta and mechanism

The original active-Hotlap off-CPU profile attributes **96.66% of TCG elapsed
time to `gp_write → qemu_mutex_lock_impl → pthread mutex/futex wait`**;
99.21% is inside `pthread_mutex_lock`. This is a blocked vCPU, rather than
four times as much translated guest computation.

`mcpx_apu_frame_thread` acquires `d->lock` outside its loop. Normally throttle
waits release it. When audio processing falls behind, throttle no longer
waits, so the worker can retain the mutex across arbitrarily many complete
`se_frame` iterations. GP/EP DSP MMIO writes require that mutex. A queued
writer can starve while its vCPU holds the QEMU big lock (BQL), also delaying
the main loop, video/timer work and other BQL users. The existing voice-lock
waiter handoff covers a different path and does not admit GP/EP writers.

Independent observations support this diagnosis:

- In the first correct baseline, approximate per-core TCG CPU use falls from
  85% to 11%, PFIFO from 53% to 6%; APU remains busy at approximately 61–64%.
  These are scheduler measurements over nearby windows, not additive frame costs.
- In the repeated baseline, main-loop BQL acquisition time rises from
  39.6 ms/s pre-race to 672.9 ms/s at T+5…15. It is 156.5 ms/s in the matched
  fixed run and 140.6 ms/s in the unsampled fixed repeat.
- The original settled window misses 328 refresh deadlines, with 253 refresh
  callbacks. Both fixed settled windows miss zero, with 606/607 callbacks.
  This establishes timer starvation; individual Xbox interrupt rates were not
  separately counted.
- GPU fence time in the first baseline is approximately 9.25 ms/frame pre-race
  and 10.87 ms active; surface downloads stay near 7.14/7.20 per frame.
  These graphics costs do not explain the approximately 4× collapse.
- The fixed sampled active window still performs approximately seven surface
  downloads per frame and about 9 ms of fence work. No graphics work was
  bypassed. GPU and download timing scopes overlap and must not be added.
- Native stack inspection did not identify translation generation, cache
  invalidation or interrupt execution as a dominant cost. Generated TCG blocks
  are not fully symbolized; there is no exact guest-PC or TB-churn claim.
- A fixed-build off-CPU follow-up no longer lists `gp_write` as a significant
  wait; BQL contention remains. This follow-up is a different settled scene,
  so it is supporting evidence rather than a matched numerical comparison.

## Change and correctness

`0062-apu-dsp-write-frame-handoff.patch` changes three Xemu files:

- `apu_int.h`: a per-device, host-only atomic waiter count. QOM zero-initializes
  it; it is not guest-visible or serialized DSP state.
- `dsp/gp_ep.c`: GP/EP writers announce before acquiring the existing mutex,
  decrement after acquiring it, and signal the worker before releasing it.
  Register writes and DSP reset behavior are unchanged.
- `apu.c`: after a complete voice/mix/GP/EP frame, wait on the existing condition
  while queued DSP writers remain. The predicate handles spurious wakes;
  condition wait atomically releases the mutex, and the writer signals while
  holding it, preventing a lost wake. The existing exit check is retained.

All DSP/voice work and protected accesses remain in their original order.
This changes host mutex scheduling, without changing Xbox clocks, skipping
audio frames, disabling a subsystem, detecting a game, reducing resolution or
altering the FPS counter. No diagnostic bypass is part of the fix.

The new stress test extracts the actual production helpers and handoff body
from the configured Xemu source. It exercises a saturated owner, 1/2/4/8
writers, 30,000 serialized writes per suite, spurious condition wakes and exit.
Both host and real RP5/Bionic suites pass. Removing the owner handoff in the
negative control fails its progress deadline as expected. This verifies the
specific starvation mechanism, not bit-exact emulation of the entire APU.
The complete ordered Xemu patch series also verifies successfully.

## Further attribution and remaining limits

Controlled comparisons on the fixed APK did not justify additional changes:

| Diagnostic | FPS sequence | Disposition |
| --- | --- | --- |
| DSP interpreter → JIT → interpreter | 28.69 → 28.24 → 28.60 | Interpreter restored |
| TCG affinity `ff → 80 → ff` | 28.54 → 28.39 → 28.46 | `ff` restored |
| Voice owner participation `0 → 1 → 0` | 29.60 → 27.82 → 27.84 | No repeatable gain; 0 restored |

The voice-owner comparison shows drift, so its difference is not evidence of a
causal regression. No DSP JIT or affinity change is promoted into the patch.

Audio remains a material bottleneck. Fixed sampled active voice/DSP wall work
is approximately 442/537 ms per second; the unsampled repeat is 366/622 ms/s.
Audio frame production remains below the 1,500 32-sample frames/s needed for
48 kHz output. In the closest 10-second audio-counter interval, missing output
frames are approximately 22% originally, 38% in the first fixed run and 26%
in the fixed repeat. No mute or dropped-frame counter increments occur. Better
gameplay throughput does not establish full-speed audio or bit-exact audio
equivalence. DSP/voice scheduling and interpreter cost deserve further work.

GPU readbacks/fences, remaining BQL contention and frame pacing are additional
opportunities. A complete driven lap, other cars and extended thermal behavior
remain unvalidated. Startup/menu attempts with profiling disabled were
inconclusive on both APKs, so the original profiling configuration was restored;
these measurements do not establish behavior with profiling disabled.

## Build, installation and evidence

The already configured ignored native tree was built without editing existing
build scripts:

```sh
source build/host-tools/env.sh
ninja -C build/native/android-arm64 -j3 libboxdroid.so
cp build/native/android-arm64/libboxdroid.so build/native/android-arm64/jniLibs/arm64-v8a/libboxdroid.so
cd android
./gradlew assembleDebug -PnativeBuildRoot=/home/aipod/Documents/BoxDroid/BoxDroid/build/native/android-arm64
adb -s 20537a44 install -r app/build/outputs/apk/debug/app-debug.apk
```

This uses the existing local configuration; it does not establish a fresh
Linux build workflow. Application data was preserved.

- Original APK SHA256: `ec87046fc6c4a4da7c08f8f41635f4f4949b57c9a358eaff1cffac9012f2e9b3`.
- Installed fixed APK SHA256: `975e1458eda485871367c598142b06a7277547d0ca87659ebd2fc3c583ce0582`.
- Installed/packaged fixed native SHA256: `860a3a28df28b9c05efa4eb637ff03a82f11b66330451c91b9769fe501cfbabc`.
- Archived unstripped and packaged native `.text` SHA256 both:
  `601a6690cfb36d714ad4819ba46b90919c60e8e1d247d7ac327b343d6b15af3d`.

Final APK/native identity was checked on the device again after the A/B runs.
The fixed APK is installed. All attribution controls are restored.

Uncommitted raw evidence stays ignored under `build/performance/forza-opt/`:
`hotlap-baseline01`, `hotlap-baseline02`, `hotlap-candidate01`,
`hotlap-candidate02`, off-CPU reports/data, attribution captures, `results.json`,
`analyze.py`, APK/library archives, build logs and handoff-test logs. Retained
profiling uses pre-existing instrumentation; the new patch adds none. Capture
helpers and raw output are not part of the patch series.

Review changes are the new patch, its series entry, the C stress test, its Python
runner and this report. The working tree is intentionally dirty and reviewable.
`main` is untouched.
