# M5.2: Android performance overlay

**Status: PASS on Retroid Pocket 5.** M5 Xbox boot and M5.1 dynamic fitting
remain PASS. This is a diagnostic overlay, not a guest performance benchmark.

M5.2 is a separate Android diagnostic package, `org.boxdroid.m52`, labeled
**BoxDroid M5.2**. Its launcher uses the M5.1 Xbox runtime, native library,
surface handling, and Vulkan presenter. The existing `org.boxdroid.m5` package
and its app-scoped files remain separate.

The Android overlay is a translucent charcoal panel with green text in the top
right safe area. It is a view above the `SurfaceView`; it never changes guest
VRAM, NV2A output, or the Vulkan image containing the Xbox frame. It shows
exactly four values and samples them every 500 ms on a separate Android
worker:

- **FPS:** completed, successful Vulkan presents per elapsed wall-clock second,
  smoothed with a 0.5 exponential average. This is presentation throughput,
  including an explicit repaint after a surface resize. A static dashboard
  can therefore read 0 FPS. It is not the guest's emulated frame rate.
- **RAM:** this process's resident set size from `/proc/self/statm`, converted
  from pages to MiB using the device page size. RSS includes resident shared
  pages; it is not PSS or total system RAM.
- **CPU:** this process's user plus system CPU ticks from `/proc/self/stat`,
  divided by the device clock tick rate, elapsed monotonic time, and the
  online logical CPU count from `sysconf(_SC_NPROCESSORS_ONLN)`, queried each
  sample. Thus 100% means all online logical CPUs are fully occupied by this
  process. Values are limited to 0–100%; no device core count is hardcoded.
- **GPU:** whole-device Adreno busy percentage from
  `/sys/class/kgsl/kgsl-3d0/gpu_busy_percentage`, read directly by the app.
  The kernel reports integer busy/total time for its latest statistics
  window, not process GPU usage, frequency, or cumulative counters.
  Missing permissions, invalid values, or unavailable data show `GPU: N/A`.

The native bridge exposes only the presenter's completed-present counter. The
worker reads its own process's `/proc` entries and one GPU sysfs node twice
per second and posts
short text updates to Android's UI thread. It does not take the QEMU BQL.
The panel uses an ARGB background of `(176, 20, 20, 20)` (about 69% opacity),
green 13 sp monospace text, and 8 dp padding and top/right margins. Android
window insets move it inside the safe area. The guest image and its aspect-fit
rectangle are unchanged.

## Build and run

Use the existing Java 17, Android SDK and NDK 30.0.16248370 setup. Provide
your own local, readable BIOS, MCPX, and QCOW2 HDD files:

```sh
./scripts/m5.2-overlay-android.sh \
  --bios /path/to/your/bios.bin \
  --mcpx /path/to/your/mcpx.bin \
  --hdd /path/to/your/hdd.qcow2
```

The wrapper uses the M5 pinned-source build and device validation procedure
with the M5.2 package, launcher, app-private staging directory, and Gradle
project. It writes an installable APK to the ignored
`build/m5.2/BoxDroid-M5.2-arm64-v8a.apk`. Neither firmware nor the APK is part
of source control. The M5 script's `PARTIAL_VISUAL_REVIEW_REQUIRED` result
still calls for visual review of the captured boot sequence and overlay.

## GPU counter semantics

The Retroid exposes `gpubusy`, `gpu_busy_percentage`, and devfreq `gpu_load`;
`run-as` and the actual unprivileged Android application can read the selected
percentage node. The overlay opens it once and rewinds it for each sample.
It runs no shell commands and takes no QEMU or presenter lock.

KGSL's [percentage implementation](https://android.googlesource.com/kernel/msm.git/+/33ec8830e329471903a5f4e2a36c1761e112799d/drivers/gpu/msm/kgsl_pwrctrl.c)
computes integer `busy_old * 100 / total_old`. Its statistics are periodically
replaced, and reset when the GPU is off. The
[devfreq statistics path](https://android.googlesource.com/kernel/msm.git/+/33ec8830e329471903a5f4e2a36c1761e112799d/drivers/gpu/msm/kgsl_pwrscale.c)
accounts busy and elapsed time in microseconds. This explains the observed
window of roughly one second; successive reads must not be subtracted as if
these were cumulative counters. The 500 ms UI cadence can repeat a kernel
window, and the value is not necessarily the exact latest 500 ms average.

A validation read on the Retroid returned `101416 1009779` from `gpubusy`,
then `10 %` from the percentage node: `101416 / 1009779 * 100 = 10.04%`,
truncated to 10%. Another read returned `91091 1008720`, then `9 %`.
These fields describe busy and total time within a completed window; no
previous/current deltas apply. Consecutive nodes are not an atomic snapshot
and can differ when a new window or an off-state reset occurs between reads.
The device reported its optional `popp` control as disabled (`0`); it was
not changed. The overlay reads only the direct percentage. It does not derive utilization
from FPS, GPU frequency, or Vulkan activity.

## Physical validation

A clean Gradle build of the four-line overlay reused the existing clean,
pinned-source Android core. Two fresh launches on the Retroid Pocket 5
validated the final implementation:

| Launch | PID | Acquire / submit / present | Failed presents | Shutdown | Crash buffer |
| --- | ---: | --- | ---: | --- | --- |
| 1 | 13349 | 318 / 318 / 318 | 0 | Clean | 0 bytes |
| 2 | 13782 | 314 / 314 / 314 | 0 | Clean | 0 bytes |

Captures from both launches show the genuine green animation, Xbox logo,
and stable dashboard prompt with the four-line overlay. Landscape output
remains aspect-correct: source 640×480, surface/swapchain 1920×1080,
destination 1440×1080 at `(240, 0)`. There were no white window bands.
Both `org.boxdroid.m5` and `org.boxdroid.m52` remain installed.

Timestamped launch 1 telemetry examples:

| Time | Phase | CPU | GPU | Raw GPU node |
| --- | --- | ---: | ---: | --- |
| 19:32:31.937 | Startup, no presents | 0% (initial baseline) | 0% | `0 %` |
| 19:32:32.937 | Startup, no presents | 13% | 10% | `10 %` |
| 19:32:39.937 | Green animation | 18% | 22% | `22 %` |
| 19:32:47.937 | Xbox logo phase | 26% | 10% | `10 %` |
| 19:32:59.938 | Static dashboard | 13% | 0% | `0 %` |

Eight online CPUs were detected in both launches. CPU usage was generally
18–28% during animated phases and about 13% at the dashboard. GPU samples
varied, including 0% snapshots during animation when the GPU was off between
submissions; the metric measures the driver's last window, not visual activity.
The measured sampler averaged approximately 2.6 ms per 500 ms update, with
logged maxima of 3.8 ms and 4.6 ms respectively. These are worker wall times,
not a controlled measurement of emulator performance impact.

The shared M5 runner still reports `PARTIAL_VISUAL_REVIEW_REQUIRED` because
it requires capture review; that review was completed for both launches.
Its M4-specific JSON status requires a separate surface recreation sequence
and is not the M5.2 acceptance result. Neither that script nor renderer,
scanout, guest boot, or dynamic-fit behavior was changed for this telemetry
correction. M5 and M5.1 remain PASS; M6 has not started.
