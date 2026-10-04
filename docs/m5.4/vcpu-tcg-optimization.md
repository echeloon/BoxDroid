# M5.4 — vCPU / TCG execution-path investigation

## Status and isolation

**PARTIAL.** The current guest requests nominal 60 Hz, but three final fresh
Retroid runs produced **18.99, 20.08, and 17.93 unique FPS** across the bounded
pre-dashboard animation interval. The sustained ≥58 FPS criterion is unmet.
The release build gives a small improvement, not the requested major step to
full speed. No polling, MMIO, or renderer shortcut is claimed as a solution.

- Branch: `android-port`; starting commit:
  `8a349e2ef1ed6fa84405395fa250673e8d7240f0`.
- Xemu pin: `478b4f496102379c7eaa7f3ec10e714a703c4300`.
- Package / label: `org.boxdroid.m54` / **BoxDroid M5.4**.
- APK: `build/m5.4/BoxDroid-M5.4-arm64-v8a.apk` (ignored).
- Host target: Android AArch64/Bionic, arm64-v8a, native API 33;
  NDK 30.0.16248370 / Clang and LLD 21, Java 17.
- Device: Retroid Pocket 5, Snapdragon 865 / Adreno 650.

The application reuses M5/M5.3 Java classes and native infrastructure, with
separate application identity, launcher entry and app-private storage.
Its EEPROM is `/data/user/0/org.boxdroid.m54/files/m5-eeprom.bin`; staging uses
its own package-scoped external `files/m5` directory. No firmware is bundled.
Original host inputs are unchanged; ordinary guest disk writes affect the
staged device copy. M5/M5.1/M5.2 remain PASS; M5.3 remains frozen PARTIAL.
All four applications coexist. No M6 work, commit, or push is included.

## Dynamic target and unique-frame accounting

The inherited observer records active `AvSetDisplayMode` mode `0x20010101`:
NTSC-M, North America configuration, 640×480×32, pitch 2560, nominal **60 Hz**.
North America is the configured generated-EEPROM default in pinned
`eeprom_generation.c`; its encrypted region was not reauthenticated separately
on every M5.4 launch. The active NTSC-M mode was observed on every final launch.
The guest-selected mode determines the deadline period: 16,666,666 ns here.
Known PAL 50 Hz modes select their own 20 ms period; unknown modes retain the
original listener scheduling rather than inventing a refresh rate. No global
60 FPS policy, EEPROM edit, or accelerated guest clock was introduced.

Unique output uses the existing full guest RGBA content hash before Android
presentation. Changed content, completed guest flips and successful presents
are counted separately. Repeated content does not count as unique FPS.
The four-line overlay still displays unique FPS, process RSS, CPU normalized
against all online CPUs and KGSL total GPU busy percentage at 500 ms cadence.

M5.4 analysis records both the inherited M5.3 window and a pre-dashboard window:
first through last changing-green bucket while the known boot reference uses
PCRTC `0x32a4000`. Every intervening bucket, including stalls, is included.
This address restriction is benchmark analysis, not an emulator selection rule
or dynamic-target implementation. A green-valued transition into direct VGA
otherwise extended final run 1 across seconds of static logo: inherited
13.29 FPS versus accelerated-animation 18.99 FPS. Both results are retained.
Endpoint buckets include partial phases; the results are not exact frame-time
percentiles. The dashboard's unchanged image is not a 60 FPS workload.

## Hot guest loop: disassembly and awaited condition

The loaded kernel's following bounded disassembly establishes what the two
previously dominant PCs do. The containing private function name is not
symbolically established; its behavior is a kernel idle/DPC/scheduler loop.

```text
8001b025  lea  ebx,[80035bdc]       ; KPCR
8001b02b  lea  ebp,[ebx+50]         ; DpcListHead
8001b02e  sti
8001b02f  nop
8001b030  nop
8001b031  cli
8001b032  cmp  ebp,[ebp]            ; DPC list empty if self-linked
8001b035  je   8001b043
8001b037  mov  cl,2
8001b039  call 8001415c
8001b03e  call 8001b08f
8001b043  cmp  dword [ebx+2c],0     ; NextThread
8001b047  je   8001b02e
8001b049  sti
8001b04a  mov  esi,[ebx+2c]
8001b04d  mov  edi,[ebx+28]         ; CurrentThread
8001b050  mov  dword [ebx+2c],0
8001b057  mov  [ebx+28],esi
8001b05a  mov  cl,1
8001b05c  call 80018dc0
8001b061  lea  ebp,[ebx+50]
8001b064  jmp  8001b02e
```

Public [Cxbx Xbox kernel structure definitions](https://github.com/Cxbx-Reloaded/Cxbx-Reloaded-legacy/blob/master/src/core/kernel/common/types.h)
independently identify KPCR+0x28 as CurrentThread, +0x2c as NextThread,
+0x30 as IdleThread and +0x50 as DpcListHead. Runtime idle-context samples show
`queue=queue_addr=0x80035c2c`, `NextThread=0` at `0x80035c08`, IF enabled.
There is **no MMIO operand in this loop**. It waits for a DPC or runnable thread,
not a particular PFIFO/PGRAPH completion register. Calls are consistent with
IRQL, DPC processing and context switching; exact private call names remain
unproven.

Host timer/device IRQ producers feed the guest ISR/scheduler machinery, which
updates these RAM structures. For video, pinned `nv2a.c:nv2a_vga_gfx_update()`
sets PCRTC vblank pending; `nv2a_update_irq()` propagates through PMC/device IRQ
and PIC/CPU interrupt delivery. Guest handlers then acknowledge/process work.
PIC and PCRTC activity continues; no missing interrupt was demonstrated.
Post-dashboard five-second samples had 300 vblank acknowledgements and zero
HLT exits in all final runs:

| PID | Window | Vblank acknowledgements/sec | Interrupt samples |
|---|---:|---:|---:|
| 25813 | 5.000104 s | 59.999 | 7,427 |
| 31047 | 5.000068 s | 59.999 | 7,028 |
| 5180 | 5.000011 s | 60.000 | 7,606 |

These prove continued delivery, not exact per-event wakeup latency or broadcast
59.94 Hz. No synthetic wakeup, idle-loop patch, arbitrary sleep or fake status
completion was added.

## Dispatch bias, TCG and MMIO evidence

Outer C dispatch is **not** every executed TB and is **not** wall-clock
residency. Pinned `target/i386/tcg/translate.c:gen_eob()` ends chaining when
clearing the STI interrupt shadow. Short idle TBs therefore return to C very
frequently, while useful work can traverse long direct chains. The old
0x8001b02f/30 profile disproportionately counted these short returns.

During multiple slow green-animation execution windows the idle outer count
was **zero**, although the vCPU remained near one-core saturation. Those
windows had roughly 16–20 thousand outer entries/sec and about 1.8 million
indirect lookups/sec. Thus eliminating the idle loop is not demonstrated to
fix moving-animation throughput. Static dashboard execution instead produced
about 20–24 million outer entries/sec before release optimization, and about
24–26 million afterward; roughly two short entries correspond to a loop
iteration, but a complete all-TB iteration counter was not installed.

The new fixed 512-slot, 1/1024 indirect-lookup sampler observes useful PCs too:

| Final PID | Samples over approximately 5 s | Leading indirect PCs (sample counts) |
|---|---:|---|
| 25813 | 8,824 | 80058c3e: 2,457; 800582b9: 346; 80058299: 331; 800429d0: 314 |
| 31047 | 8,929 | 80058c3e: 2,498; 800582b9: 358; 800429d0: 344; 80058cab: 331 |
| 5180 | 7,964 | 80058c3e: 1,388; 800429d0: 253; 8005a620: 196; 800566cf: 183 |

No table overflow occurred. Direct chained branches remain outside this sample.
Across complete animation execution windows, indirect lookup hits exceed
99.96%; hundreds of misses/sec do not establish a translation-cache bottleneck.
`last_tb != first_tb` is logged only as a chain-return proxy, not an exact
chaining success rate. Requested exits and monitored device accesses are
separate from TB lookup misses.

| Rate in complete animation execution windows | Baseline 1 / 2 | Final 1 / 2 / 3 |
|---|---:|---:|
| Outer idle entries/sec | 1.15M / 0.77M | 0.96M / 1.22M / 1.61M |
| Idle fraction of outer entries | 96.66% / 97.85% | 98.21% / 98.61% / 97.76% |
| Indirect lookup hits/sec | 1.47M / 1.42M | 1.61M / 1.57M / 1.57M |
| Lookup misses/sec | 525 / 153 | 154 / 146 / 468 |
| Requested exits/sec | 904 / 966 | 950 / 921 / 871 |
| Monitored device reads/sec | 2,427 / 2,323 | 2,446 / 2,455 / 2,483 |
| Monitored device writes/sec | 3,288 / 2,740 | 2,821 / 2,791 / 3,207 |

These idle fractions are explicitly **count fractions**, not CPU-time polling
residency. CPU-time polling residency, all-MMIO exits, TLB exits, invalidations
and exact useful-vCPU percentage remain unmeasured. Device counters cover
previously instrumented Xbox/PIC accesses, not every QEMU memory helper.
There is no evidence for millions of MMIO exits from the idle loop.

## Host CPU profile and scheduler

Unprivileged Android Simpleperf (`cpu-clock:u`, 199 Hz, bounded 8 s) was used
in a separate profiling launch, excluded from final benchmark acceptance.
NDK symbols from the matching unstripped library resolve host PCs. In the
moving-animation capture, sampled process CPU was approximately 54.26% vCPU,
21.05% APU, 11.61% PFIFO and 7.54% main-loop/presenter. Selected aggregate
sample shares were:

| Host path | Share of sampled process CPU |
|---|---:|
| parts64_uncanon_normal | 4.42% |
| parts128_canonicalize | 3.79% |
| floatx80_addsub | 3.26% |
| floatx80_mul | 3.25% |
| floatx80_round_pack | 2.10% |
| helper_cc_compute_c | 2.52% |
| helper_lookup_tb_ptr | 0.93% |
| dsp56k_execute_instruction, APU | 7.01% |

Additional samples occurred in x87 load/conversion helpers and generated TCG
code. Software extended-precision arithmetic is a substantial serial cost;
the profile does not attribute every missing millisecond to it. The guest's
single instruction stream cannot be split arbitrarily between cores.

Detected capacities/max frequencies: CPUs 0–3: 351 / 1.8048 GHz; 4–6: 871 /
2.4192 GHz; CPU 7: 1024 / 2.8416 GHz. The vCPU was usually sampled on CPU 7,
PFIFO on 5/6 and main-loop/presenter on 4/5. Device clocks sampled at these
maxima. One-second observations miss intervening migrations and do not prove
every scheduling interval. No affinity or priority experiment was justified;
none was applied. QEMU thread naming is enabled only for M5.4 diagnostics.

Total normalized CPU around 24–26% during moving imagery does not imply the
critical vCPU has spare capacity: it uses approximately 91–92% of one core.
Other cores are not substitutes for serial x87/TCG work. The APU worker uses
about 41% of one core; it was not disabled to improve numbers. GPU idle gaps
are consistent with limited guest command production, not a measured
presentation bottleneck.

## BQL, PFIFO, renderer and critical path

Pinned RR TCG already releases the BQL around `tcg_cpu_exec()` in
`accel/tcg/tcg-accel-ops-rr.c`. Switching to MTTCG would not by itself release
a continuously held BQL. Existing M5.3 scanout/presenter BQL release and APU
voice-lock handoff remain unchanged. No new concurrency/lock/queue ownership
change, offloading thread or polling thread was added.

PFIFO consumes guest commands and invokes Vulkan rendering on its worker.
Animation guest flips remain below target; Android presentation follows them.
Synchronous Vulkan submission/resource reuse waits remain in `vk/draw.c`,
with approximately 1.75–2.00 ms average fence wait, 8.5–9.6 ms maximum across
the captured run. Cold pipeline creation can take about 30–50 ms. These costs
can affect PFIFO but do not explain the whole 50+ ms changed-frame interval.
No fence was removed and no unowned resource reuse was introduced.

| Measured stage | Baseline 1 / 2 | Final 1 / 2 / 3 |
|---|---:|---:|
| Mean changed-frame interval, ms | 58.47 / 51.74 | 52.67 / 49.80 / 55.77 |
| Scanout acquisition/download per delivered frame, ms | 4.25 / 4.00 | 4.17 / 5.12 / 5.55 |
| Scanout BQL reacquisition per frame, ms | 0.019 / 0.050 | 0.030 / 0.035 / 0.089 |
| Conversion/hash per delivered frame, ms | 2.48 / 2.46 | 2.49 / 2.52 / 2.50 |
| Presenter per delivered frame, ms | 5.54 / 5.45 | 5.38 / 5.49 / 5.37 |
| Main-loop BQL wait, ms/sec, whole run | 7.11 / 7.35 | 7.66 / 7.18 / 7.04 |
| Main-loop maximum BQL acquisition, ms, whole run | 13.28 / 13.54 | 22.58 / 14.02 / 13.25 |
| Renderer average fence wait, ms, whole run | 1.88 / 1.75 | 1.92 / 2.00 / 1.97 |

These are aggregate observations, not disjoint stages that sum to one frame.
Guest execution, PFIFO and presentation overlap. An exact per-frame causal
timeline, all-thread BQL ownership/hold distribution, PFIFO queue depth and
per-IRQ producer latency were not established. Sparse sampled TB execution
time is not a valid replacement for those measurements.

WSI acquire averages 0.028–0.030 ms, submit 0.216–0.236 ms and present
0.233–0.260 ms. Fitting averages 3.22–3.29 ms and presenter fence wait about
0.93–1.08 ms across captures. FIFO and four swapchain images are retained.
Current output is 1920×1080, with 640×480 source fitted into 1440×1080 at
(240,0), identity preTransform. Refresh averages roughly 55–58 callbacks/sec
across analyzed animation intervals and approximately 60 in static output.
Guest refresh deadlines, not compositor duplicates, define the target.

## Optimization experiments

### Retained: isolated release compilation

Only the M5.4 wrapper opts into `-Doptimization=3`, `-Dqom_cast_debug=false`,
and ThinLTO. Default M5/M5.2/M5.3 compilation retains its original options.
The experiment targets measured helper/QOM overhead and enables cross-file
optimization without fast-math or altered x87 semantics. Original SoftFloat
is preserved. QOM debug casts check host object types, not guest device state.
Explicit profile reuse is validated against Meson options; changing profiles
requires a different work root. ThinLTO IR target triples and final ELF64 /
AArch64 linkage are checked separately.

Whole-window means are 18.21 FPS baseline and 19.00 FPS final: about 4.3%,
within considerable run variation. Ordinary moving buckets increased from
approximately 15–18 to 16–21 FPS. This supports retaining the opt-in release
profile as a modest improvement; it does not establish a major throughput
gain, an exact statistically isolated compiler effect, or full guest speed.

### Rejected: x87 specializations

| Experiment | Differential evidence | Sustained unique FPS | Decision |
|---|---|---:|---|
| FloatParts64 specialization for eligible PC24/53 operands | ~432k result/flag comparisons passed | 19.11 | No sustained gain; excluded |
| Checked binary32/64 hardware arithmetic | Corrected variant ~630k comparisons passed | 15.75 | Slower; excluded |
| Native AArch64 arithmetic with FPCR/FPSR preservation | ~630k comparisons passed | 14.86 | State/flag overhead; excluded |
| Exact binary64 operations and optional binary32 rounding | 55,236 admitted comparisons passed | 16.08 | No gain; excluded |

An intermediate exponent-span guard failed a differential test and disabled
the fast path before guest execution; its run used reference arithmetic and
is not evidence for a valid optimized implementation. Corrected versions were
benchmarked independently. No precision reduction, ignored exceptions,
firmware patch, or arbitrary host-FPU substitution remains in the series.
Rejected patch versions and generated test trees are preserved only as ignored
experiment evidence. Final reconstruction contains no experimental patch 0017.

## Three final fresh launches

All runs used the final release-built native library from fresh pinned-source
reconstruction. The Android project was also built with `clean assembleDebug`;
the native library is identical across the APK packaging rebuild.

| Metric | Run 1 | Run 2 | Run 3 |
|---|---:|---:|---:|
| PID | 25813 | 31047 | 5180 |
| Package | org.boxdroid.m54 | org.boxdroid.m54 | org.boxdroid.m54 |
| Region / active mode | North America / NTSC-M | North America / NTSC-M | North America / NTSC-M |
| Dynamic target / budget | 60 Hz / 16.6667 ms | 60 Hz / 16.6667 ms | 60 Hz / 16.6667 ms |
| Unique guest FPS | 18.99 | 20.08 | 17.93 |
| Successful delivered/presented FPS, same animation window | 24.73 | 23.61 | 20.63 |
| Guest completed flips/sec | 24.73 | 23.61 | 20.36 |
| Duplicate fraction | 23.21% | 14.95% | 13.10% |
| vCPU, % of one core, 4–12 s | 91.60 | 91.09 | 91.29 |
| PFIFO, % of one core, 4–12 s | 27.61 | 27.44 | 27.60 |
| Main-loop/presenter, % of one core, 4–12 s | 19.54 | 18.67 | 18.26 |
| APU, % of one core, 4–12 s | 41.06 | 41.44 | 41.19 |
| Acquire / submit / present | 540 / 540 / 540 | 542 / 542 / 542 | 548 / 548 / 548 |
| Failed presents | 0 | 0 | 0 |
| Green animation / logo / dashboard | visible / visible / visible | visible / visible / visible | visible / visible / visible |
| Shutdown / crash buffer | clean / 0 bytes | clean / 0 bytes | clean / 0 bytes |

Sparse overlay samples during the analyzed intervals were CPU/GPU:
run 1: 25%/20%, 25%/17%; run 2: 26%/18%, 25%/17%; run 3:
14%/5% during an endpoint, 26%/17%, 24%/16%. These are logged point samples,
not continuous interval averages. Comparable baseline samples included
25–26% CPU and 15–19% GPU during moving imagery. Utilization does not prove
useful-vCPU fraction. Full-frame interval distributions and worst individual
frame spikes remain unmeasured; aggregate stage maxima are reported above.

Captures at 6 s, 12 s and 20 s show genuine green imagery, Xbox logo and
dashboard respectively, in landscape with aspect-fit, black borders and the
FPS/RAM/CPU/GPU overlay. No white bands were observed. Later dashboard captures
remain stable. The inherited M4 JSON `status=FAIL` in these runs means the
M4-required recreation sequence was not run; all M5.4 WSI operation counters
passed and each run created/destroyed one surface and one swapchain.

## Regression and provenance

The installed frozen M5.3 application was relaunched after M5.4 installation:
PID 22654, 16.84 unique FPS, 17.43 flips/sec, 17.73 delivered FPS, 5.03%
duplicates, 59.40 ms mean changed-frame interval. Green animation, logo and
dashboard captures were inspected; fitting/overlay remained correct, shutdown
was clean and crash buffer empty. It retains its PARTIAL performance status.
M5, M5.2, M5.3 and M5.4 were confirmed installed simultaneously. Existing
applications and their app-private data were not overwritten.

Default-path source changes are guarded by `BOXDROID_M54_RUNTIME`; M5.4 also
enables the inherited `BOXDROID_M53_RUNTIME`. No retained shader, Vulkan queue,
fence, presenter, framebuffer, scanout, VGA fallback, BQL, guest timing,
firmware, EEPROM or boot-policy change was made in M5.4. M5/M5.1/M5.2 PASS is
preserved; no new device regression of those three frozen applications is
claimed in this run.

Fresh patches 0001–0016 apply in order to the exact pin and match the compiled
tracked source. Copied native sources match the repository byte-for-byte.
The clean native library is ELF64/AArch64 with no desktop GL or libpcap
dependency. Shell/Python/package checks and `git diff --check` pass.
All measurements, screenshots, perf recordings and APKs remain ignored.
Pre-existing upstream untracked content is untouched. Nothing is staged,
committed or pushed.

## Reproduction

Use user-supplied local paths; originals are not edited or bundled:

```sh
export JAVA_HOME=/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/30.0.16248370"
export BOXDROID_M54_WORK_ROOT="$PWD/build/m5.4/new-clean-root"
export BOXDROID_M54_RESULTS="$PWD/build/m5.4/new-run"
scripts/m5.4-execution-android.sh --bios "$BIOS_PATH" --mcpx "$MCPX_PATH" --hdd "$HDD_PATH"
```

For an unoptimized comparison, select another fresh root and set
`BOXDROID_M54_RELEASE=0`. For build/install/stage only, set
`BOXDROID_M54_PREPARE_ONLY=1`. Subsequent sequential fresh runs:

```sh
python3 scripts/m5.4-benchmark.py --results build/m5.4/run-2 --seconds 45
python3 scripts/m5.4-benchmark.py --results build/m5.4/run-3 --seconds 45
python3 scripts/m5.4-benchmark.py --package org.boxdroid.m53 --results build/m5.4/m53-check --seconds 45
```

Wait for each benchmark process to finish before starting another. Two early
overlapping captures were rejected, preserved as ignored evidence, and excluded
from baseline and final tables. Valid baselines are `baseline-valid-1/2`;
final evidence is `release-1/2/3`. Analysis writes both performance and execution
JSON; it never creates an automatic visual PASS.

## Remaining bottleneck and next engineering step

The evidence localizes the remaining limit to serial guest production, with
substantial extended-precision arithmetic/helper cost. It does **not** prove
an NV2A polling register, lost IRQ, scheduler affinity defect or missing
renderer wakeup. A safe idle-loop wait needs interrupt-boundary equivalence
and may reduce static CPU burn without improving animated throughput.

The next focused implementation should target x87/TCG helper transitions and
exception/rounding bookkeeping using translation-time dataflow and a
differentially tested block-level fast path. The tested per-operation
specializations did not suffice. Exact full-speed causality and a safe
high-impact replacement remain unresolved; further work is still M5.4, not M6.
The current result must remain **PARTIAL** until sustained unique output reaches
the active guest target without correctness compromises.
