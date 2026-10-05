# M5.3 — Dynamic full-speed guest performance

## Status

**PARTIAL.** Three fresh physical Retroid launches preserve the genuine green
animation, Xbox logo, and HDD dashboard prompt, but deliver only **16.12,
19.63, and 16.54 unique guest FPS** through the measured changing green phase.
The current nominal 60 Hz mode requires sustained ≥58 unique FPS. Successful
presents, repeated images, and vblank interrupts do not satisfy that criterion.

M5, M5.1, and M5.2 remain frozen PASS milestones. No M6 work is included.

## Baseline and app isolation

- BoxDroid branch: `android-port`.
- Starting commit: `178168c29cad6a14a6ad6e39ef93e4469edb9778`.
- Xemu pin: `478b4f496102379c7eaa7f3ec10e714a703c4300`.
- Host ABI/API: Android AArch64, arm64-v8a, native API 33, Bionic.
- Toolchain: NDK 30.0.16248370, Clang/LLD 21; Java 17.
- Device: Retroid Pocket 5, Snapdragon 865 / Adreno 650.
- New package: `org.boxdroid.m53`; label: `BoxDroid M5.3`.
- APK: `build/m5.3/BoxDroid-M5.3-arm64-v8a.apk` (ignored).

The app reuses M5's Activity, JNI lifecycle, runtime, presenter, and build path.
Its launcher is `org.boxdroid.m5.PerformanceActivity`; its application identity
and data remain separate from `org.boxdroid.m5` and `org.boxdroid.m52`.
Firmware is staged to its own package-scoped external files directory; its
EEPROM is `/data/user/0/org.boxdroid.m53/files/m5-eeprom.bin`. No firmware is
bundled. Original host inputs are unchanged; normal guest writes affect only
the staged test HDD.

All native performance changes are guarded by `BOXDROID_M53_RUNTIME`. Default
M5/M5.2 builds retain their original scheduling, scaling, and locking paths.
The version map uses an optional `nativeM53*` JNI pattern so a default build
can link without M5.3-only getters; the rebuilt default library exports no
M5.3 symbols.

## Dynamic guest video target

The current 256-byte M5.3 EEPROM was inspected without modification. Its
security section authenticates after decoding with pinned Xemu's R1 EEPROM
algorithm: region `0x1` (North America). Factory video standard is
`0x00400100` (NTSC-M, factory 60 Hz flag set, 50 Hz flag clear).

M5.3 observes the guest's actual `AvSetDisplayMode` call, using the loaded
kernel PE export table and export ordinal 3. It reads the mode arguments;
it does not edit guest memory. The current selected mode is **`0x20010101`**,
640×480 NTSC-M/SCART at nominal **60 Hz**, pitch 2560. Nominal mode definitions
come from [nxdk's video-mode table](https://github.com/XboxDev/nxdk/blob/master/lib/hal/video.c).

The selected mode determines `period_ns = 1,000,000,000 / mode_hz`. Known
50 Hz PAL modes therefore select 20 ms; known 60 Hz modes select approximately
16.6667 ms. The EEPROM and Android panel refresh do not set this target.
Mode changes update the deadline period. Unknown modes log a zero/unknown
target and retain the original QEMU listener interval rather than inventing
a target. PAL operation and other firmware/kernel layouts have not been
validated on hardware. Exact broadcast 59.94 Hz is not established by this
nominal mode observer.

The reset PRAMDAC PLL/CRTC values were inspected. Using the VGA PLL as a TV
scanout clock predicts a rate inconsistent with the selected mode, so it is
not used as the timing authority.

Independent post-dashboard guest vblank acknowledgement samples were:

| Final run | Acknowledgements | Window | Measured rate |
|---|---:|---:|---:|
| 1 | 300 | 5.000464 s | 59.994 Hz |
| 2 | 301 | 5.000682 s | 60.192 Hz |
| 3 | 300 | 5.000117 s | 59.999 Hz |

During animation, refresh callbacks averaged 56.75–57.91 Hz because work can
miss deadlines. That slowdown does not lower the guest target to 57 Hz.

## Unique-frame methodology and diagnostics

The existing complete guest RGBA hash is reused after Pixman conversion and
before presentation. A different hash increments the M5.3 unique-frame
counter; unchanged frames do not. This is observed scanout content change,
not a claim that every offscreen render target is a displayed frame.
An independent counter records guest `FLIP_INCREMENT_WRITE` completions.
Those completions closely match changed output during the moving animation,
so there is no evidence of 60 completed meaningful frames being discarded
by the presenter.

`PERF` logs approximately once per second: unique/content frame counts,
guest flips, changing-green count, refresh count/period, callback time,
scanout time, BQL reacquisition, conversion/hash time, presenter time, and
video registers. `WSI` aggregates 30 completions. `NV_RENDER` aggregates
pipeline creation, submission, fence waits, and finish reasons. Slow MMIO
and BQL ownership logs are bounded. A five-second 1/1024 TB sample records
repeated PCs with a fixed-size table and reports overflow.

The analyzer includes **all** intervals from the first through the last
changing-green interval, including intervening stalls. It does not select
only fast buckets. Cold start, partial endpoint buckets, and screenshot
capture overhead remain in the results. Initial black frames and the static
dashboard are not counted toward the animation performance target.

Overlay FPS uses the unique counter with a smoothed interval average.
Successful presents remain separately logged. The four-line Android overlay
retains 500 ms sampling, process RSS in MiB, CPU normalized against all online
CPUs, and KGSL whole-device GPU busy percentage. Eight CPUs were online.
It never alters Xbox pixels or holds the BQL for telemetry.

## Baseline and measured changes

Two fresh M5.3 launches were collected before performance changes:

| Run | PID | Observed unique FPS | Presented FPS in same intervals | Mean changed-frame interval | Outcome |
|---|---:|---:|---:|---:|---|
| Baseline 2 | 14480 | 1.28 | 1.28 | 778.88 ms | Animation repeatedly stalled; shutdown did not finish within capture wait |
| Baseline 3 | 17744 | 1.25 | 1.25 | 797.80 ms | Animation repeatedly stalled; clean shutdown |

Their fastest active one-second buckets were approximately 20.7 and 19.9
unique FPS. The very low sustained figures include long stalls; they do not
mean the renderer's active throughput improved by an order of magnitude.
Neither baseline completed the whole animation within the observation.
Baseline 3's last accumulated timing bucket extended into shutdown waiting;
its analyzed intervals cover 49.46 s, while baseline 2 covers 42.84 s.
Both crash buffers were empty. An earlier screen-dozing capture was rejected
and is not counted as a valid baseline.

Logged CPU sample means across those stalled intervals were approximately
14–15% total capacity; GPU means approximately 2%. Active early samples were
26–27% CPU and 22–23% GPU. Idle utilization during a stall is not spare
capacity that the renderer can automatically exploit.

### 1. Presenter preparation

The original CPU fitting loop used integer divisions for every destination
pixel. On the current 1920×1080 surface, preparation averaged approximately
9.0 ms/frame. The M5.3 path uses Pixman's nearest-neighbour SIMD scaling and
channel conversion into the **same** aspect-fit rectangle and black margins.
Preparation is now 3.21–3.27 ms/frame across final runs. The guest framebuffer
and fitting policy are unchanged. Scaling alone did not remove boot stalls.

### 2. Refresh scheduling

Pinned `ui/console.c:gui_update()` schedules the next callback at the time
**after** `dpy_refresh()` finishes plus the listener's default 16 ms. Callback
work is therefore added to every period. This was confirmed from code and
callback start/end timing; it was not the only bottleneck.

The gated M5.3 path advances an absolute deadline by the selected guest period.
It skips expired deadlines and resets the anchor when the mode changes.
There is no polling thread, burst of fake catch-up vblanks, guest-clock
acceleration, or fixed NTSC/PAL timer policy. Steady static-logo/dashboard
refresh reaches approximately 60 callbacks/sec. During animation it still
misses some deadlines.

### 3. APU/BQL starvation

A subsequent instrumented experiment localized multi-second stalls to a
vCPU MMIO write at `0xfe8202fc`, MCPX APU VP offset `0x2fc`:
`NV1BA0_PIO_VOICE_LOCK`. `vp.c:voice_lock()` waits for the APU mutex while the
vCPU owns the BQL. The busy APU frame worker repeatedly reacquired that mutex.
Recorded individual MMIO waits included 1.27–1.45 s; main-loop BQL reacquisition
later reached **5.56 s**. Main-loop poll/replay/main-loop-lock timings were not
the source of those pauses.

M5.3 counts queued voice-lock writers. Between complete APU frames the worker
releases the mutex through its existing condition variable until pending
writers update the protected voice bitmap and signal it. Audio work, voice
ordering, audio-clock throttling, and guest register effects are preserved.
No priority/affinity changes or skipped emulation work were introduced.

Final animated-window voice-lock wait totals were approximately 178–189 ms
across 8–10 s; individual maxima were 3.94–5.22 ms. Main-loop maximum BQL waits
in those windows were 5.34, 5.78, and 7.55 ms. The multi-second starvation is
resolved; that result alone does not establish full-speed emulation.

### 4. Presenter/BQL overlap

After guest pixels are converted into an owned RGBA buffer and scanout is
released, M5.3 drops the BQL for the synchronous presenter call and reacquires
it afterward. Presenter lifecycle/frame delivery remains serialized by its
existing mutex. This allows vCPU work during CPU fitting and WSI submission.
The frozen M5/M5.2 path is unchanged.

Representative intermediate experiments (not equivalent complete-animation
windows) had peak one-second unique rates: scaling only ~21.7, deadline
scheduling ~22.9, APU handoff ~22, and presenter overlap ~23.9 FPS. These peak
figures are diagnostic observations, not sustained PASS results. All final
acceptance figures below come from the clean reconstructed implementation.

## Remaining critical path

The remaining deficit is **before completion of guest/NV2A frames**. In an
ordinary moving-green interval, guest flips and unique scanouts are both
approximately 16–18/sec while refresh is approximately 60/sec. Increasing
present count or replaying unchanged images cannot repair that deficit.

Across 4–12 s thread samples:

| Final run | vCPU, one-core usage | PFIFO, one-core usage | Main-loop/presenter, one-core usage |
|---|---:|---:|---:|
| Baseline 2 | 5.49% | 1.59% | 1.42% |
| Baseline 3 | 4.55% | 1.09% | 1.27% |
| 1 | 92.5% | 25.4% | 19.7% |
| 2 | 92.7% | 25.8% | 19.7% |
| 3 | 92.4% | 25.4% | 19.6% |

Baseline rows show the stalled pre-optimization path in the same 4–12 s
window; low usage there reflects blocking, not a fast guest.

The final vCPU was runnable and sampled on CPU 7 (the highest reported CPU capacity).
Other threads spend time in condition-variable/futex waits. Aggregate CPU
usage hides the pressure on the single Xbox vCPU. A separate worker used
approximately 40% of one core, but its generic thread name does not prove a
subsystem identity. No scheduling priority or affinity was changed.

Bounded guest samples remain heavily concentrated at `0x8001b02f` and
`0x8001b030`, with other boot PCs progressing. This includes guest polling;
92% vCPU usage must not be interpreted as 92% productive draw work. The exact
condition accounting for the remaining polling/render-production delay is
not fully isolated. The measurements do **not** prove TCG instruction
throughput alone is the remaining cause.

The Vulkan backend synchronously submits and waits inside
`pgraph_vk_finish()`. Approximately 40–50 submits/fence waits per second
occur during moving content, often around three finishes per completed
frame. Finish reasons include surface download, buffer-space exhaustion,
and flip stall. In an instrumented moving-green example, fence waits consumed
approximately 125–146 ms/sec; pipeline creation was zero in the central steady
animation and cost up to about 50 ms per creation during cold startup.
Final runs accumulated about 1.00–1.05 s of renderer fence waiting over their
8–10 s changing-green intervals, with individual maxima 7.4–8.8 ms.

GPU idle gaps are consistent with intermittent guest/PFIFO feeding and
synchronous resource reuse, not evidence that the GPU is unable to render.
Removing those waits requires safe ownership of in-flight command buffers,
vertex/uniform storage, descriptor sets, and framebuffers. The current
backend resets/reuses these resources immediately after the fence. Merely
removing waits would introduce corruption. That architectural work is not
performed or represented as solved here.

The next focused M5.3 action is to correlate guest submission/polling with
PFIFO draw/flip readiness and buffer-space flushes, then redesign resource
lifetimes only for the first demonstrated serialization barrier. It is not
a request to begin M6.

## Final physical validation

All runs used `org.boxdroid.m53` and the same own persisted EEPROM:
North America / NTSC-M; selected nominal 60 Hz; target 60 unique FPS;
nominal budget 16.6667 ms. No firmware or guest configuration changes.

| Run | PID | Unique FPS | Presents/sec during measured green intervals | Guest flips/sec | Duplicate fraction | Mean changed-frame interval | Acquire / submit / present |
|---|---:|---:|---:|---:|---:|---:|---|
| 1 | 546 | 16.12 | 17.80 | 17.50 | 9.44% | 62.05 ms | 527 / 527 / 527 |
| 2 | 7268 | 19.63 | 20.50 | 20.50 | 4.22% | 50.93 ms | 533 / 533 / 533 |
| 3 | 12873 | 16.54 | 17.53 | 17.33 | 5.65% | 60.46 ms | 524 / 524 / 524 |

The animation statistics cover 10.11, 8.10, and 10.10 s respectively. Short
endpoint buckets can include early static-logo frames; duplicate counts
remain explicit. The bounded early timeline recorded changing-green gaps
up to 2.30, 0.177, and 2.37 s, including initial startup transitions. It is
capped at 128 events and is not a complete per-frame percentile trace.

For all three runs:

- Genuine green animation, Xbox logo, and dashboard prompt captured on-device.
- Landscape; guest 640×480; actual surface/swapchain 1920×1080.
- Dynamic aspect-fit: 1440×1080 at (240, 0), scale 2.25; black unused area.
- Four-line overlay readable; no white bands.
- Zero failed presents; one swapchain creation/destruction per run.
- Clean native and Vulkan shutdown; crash buffer 0 bytes.
- Identity preTransform retained; recoverable SUBOPTIMAL does not recreate
  the swapchain every frame.

Logged animated CPU sample means were 21.3%, 25.5%, and 22.0% total capacity;
GPU means 12.3%, 16.5%, and 12.7%. These are sparse diagnostic sample means,
not continuous hardware profiler averages. Central green samples typically
showed 24–26% CPU and 14–18% GPU; the static dashboard settles around 13% CPU,
0% GPU, and correctly reports 0 unique FPS.

### Stage measurements

All values below are wall time, and overlapping stage totals must not be
added as independent CPU-work time.

| Stage, ms/frame | Baseline 2 / 3 | Final 1 / 2 / 3 |
|---|---|---|
| Accelerated scanout incl. renderer wait/readback | 8.99 / 10.35 | 4.15 / 3.91 / 4.32 |
| BQL reacquisition around scanout/presenter | 0.022 / 0.030 | 0.037 / 0.013 / 0.074 |
| Pixman conversion + content analysis | 3.15 / 3.18 | 2.48 / 2.47 / 2.48 |
| Whole presenter call | 10.24 / 10.40 | 5.33 / 5.54 / 5.54 |
| WSI acquire | 0.036 / 0.041 | 0.029 / 0.027 / 0.029 |
| WSI buffer preparation/fitting | 8.98 / 9.08 | 3.21 / 3.23 / 3.27 |
| WSI command recording + submit | 0.231 / 0.219 | 0.200 / 0.214 / 0.216 |
| WSI present | 0.310 / 0.291 | 0.230 / 0.270 / 0.243 |
| Presenter queue-idle/resource cleanup | 0.844 / 0.866 | 1.161 / 0.992 / 0.988 |

WSI averages aggregate all complete 30-frame groups, including static logo
presents. Scanout/other callback averages use the measured animation windows.
The synchronous readback timer includes renderer completion; an isolated
GPU-copy-only duration was not measured. Likewise, wall-time fence waits are
not a hardware GPU execution-time measurement.

## Android/Vulkan audit and rejected hypotheses

Android reports a panel refresh of approximately 60.000004 Hz. WSI exposes
MAILBOX, FIFO, and shared present modes; the existing **FIFO** selection is
retained. Queue family 0, four swapchain images, format 37
(R8G8B8A8_UNORM), current transform 90° / selected identity preTransform.
The original one-frame synchronous presenter remains; no frames-in-flight
change or Vulkan barriers/fences/copy semantics were altered.

Acquire and present average well below 1 ms, so Android FIFO blocking is not
the observed main limiter. Static logo frames can present around 60/sec while
unique FPS is zero, independently demonstrating why present FPS is inadequate.
No vkQueueWaitIdle/vkDeviceWaitIdle was removed. No guest clock, firmware,
EEPROM, vertex/shader state, scanout eligibility, or VGA fallback was changed.
No priority increase, CPU pinning, interpolated frames, replayed boot video,
or skipped emulation work was used.

## Coexistence and regression

All three packages remain installed. After M5.3 installation, the existing
M5.2 app was explicitly launched: PID 27714, full boot sequence, readable
FPS/RAM/CPU/GPU overlay, correct dynamic fit, 338 successful presents, zero
failures, clean shutdown, and empty crash buffer. Its installed APK/data were
not replaced by M5.3.

A fresh M5.2 native rebuild with the M5.3 flag absent exposed an optional-JNI
version-map linking error; that declaration was corrected. The reconstructed
default core and isolated M5.2 APK now build successfully and export only the
original M5/M5.2 API. That rebuilt APK was not installed over the frozen app.
M5/M5.1/M5.2 remain PASS; M3/M4 were not rerun during this performance task.

## Reproducible build and capture

Use the existing installed Java/SDK/NDK environment. Supply your own legal
local firmware/HDD paths; never place those inputs in the repository.

```sh
export BOXDROID_M53_WORK_ROOT="$PWD/build/m5.3/fresh"
export BOXDROID_M53_RESULTS="$PWD/build/m5.3/fresh-results"
./scripts/m5.3-performance-android.sh \
  --bios "$LOCAL_BIOS" --mcpx "$LOCAL_MCPX" --hdd "$LOCAL_HDD"
```

This reconstructs pinned Xemu, applies patches 0001–0015, builds native and
Android targets, installs only M5.3, verifies staged hashes, and captures a
bounded run. To prepare without running, set `BOXDROID_M53_PREPARE_ONLY=1`.
For further fresh-process runs of the installed/staged app:

```sh
./scripts/m5.3-benchmark.py --results build/m5.3/run-1
./scripts/m5.3-benchmark.py --results build/m5.3/run-2
./scripts/m5.3-benchmark.py --results build/m5.3/run-3
./scripts/m5.3-analyze.py build/m5.3/run-1
```

The capture script uses host ADB for bounded thread sampling/screenshots;
Android telemetry itself uses no ADB or shell subprocess. Results, binaries,
EEPROM context, screenshots, and firmware-derived captures remain ignored
under `build/m5.3/`. The analyzer writes a generated JSON report and never
manufactures an automatic PASS from present counters alone.

The clean M5.3 root used here was `build/m5.3/final-clean`; all patches applied
from the pinned commit. Reconstructed patched files match the reviewed patch
series and copied native sources. `libboxdroid.so` is ELF64/AArch64, SONAME
`libboxdroid.so`; dependencies are libc, libm, libdl, liblog, libandroid, and
libc++_shared. No desktop OpenGL or libpcap dependency was introduced.

## Limitations and exit decision

- Full-speed unique guest output is **not achieved**; M5.3 remains PARTIAL.
- Remaining guest/PFIFO production/polling causality needs deeper isolation.
- The backend still serializes resource reuse with fences and CPU readback.
- No PAL hardware test, arbitrary BIOS/kernel-layout coverage, or exact
  broadcast-clock derivation is claimed.
- Sampling/hash/capture overhead was not independently calibrated; these are
  diagnostic measurements, not production performance certification.
- The generic M4 JSON can say FAIL because an M5 boot run does not exercise
  M4's two-surface recreation acceptance sequence. Its raw counters are used;
  this does not indicate failed M5.3 presents.
- No game compatibility, native 720p rendering, controller/audio completion,
  production readiness, or new milestone work is claimed.

No commit or push was performed. Upstream tracked files and the Xemu pin are
unchanged; pre-existing upstream untracked content remains untouched.
