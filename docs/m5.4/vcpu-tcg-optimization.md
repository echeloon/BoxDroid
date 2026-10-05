# M5.4 — vCPU / TCG execution-path investigation

## Status and isolation

**PARTIAL.** The current guest requests nominal 60 Hz, but three final fresh
Retroid runs produced **19.78, 19.67, and 17.52 unique FPS** across the bounded
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
experiment evidence. Active patch 0017 is profiling-only; the rejected
TB-local candidate is not in the active series.

## Earlier checkpoint launches

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

## Extended x87/TCG investigation

**M5.4 remains PARTIAL.** This iteration retains the checkpoint's O3/ThinLTO/
disabled-QOM-cast-debug profile. No new performance candidate was retained.
The active NTSC-M target remains nominally 60 unique FPS, with the existing
>=58 sustained criterion. M5/M5.1/M5.2 remain PASS; M5.3 stays frozen PARTIAL.
No M5.5/M6 work, commit, or push was performed.

### Measurement design

Patch `0017-m54-x87-workload-profile.patch` is opt-in through
`BOXDROID_M54_X87_PROFILE=1` in the M5.4 wrapper. It records executed x87
opcode/ModRM counts, fixed helper IDs, helper pairs, sampled control words,
and operand classes for five seconds after the first changing-green frame.
Counts are vCPU-owned; the start anchor is atomic. Tables are fixed-size:
2048 opcode bins, 82 helper identities, and 1024 instruction-PC slots. Logging
occurs once at window completion. The PC summary omits counts <=10,000.
Helper timings are sampled at 1/2048 using ARM64 CNTVCT, with CNTFRQ conversion,
a paired-counter calibration and thread-CPU window measurement. Arithmetic
operand classification is also sampled; its work is included in those timing
samples. Thus these durations are instrumentation estimates, not precise
unperturbed helper latency. No BQL, GPU, guest-state or timing changes were
introduced by this instrumentation.

The separate diagnostic APK additionally captures translation-only `in_asm`,
`op`, and `out_asm` in three bounded hot address ranges during the 45-second
run. It does not log every execution or dump modules/firmware. Profiling is
**disabled** in the final validation APK, so opcode instrumentation and these
translation logs do not contaminate final FPS comparisons. Opt-in instruction
counts themselves slow the guest; their rates must not be extrapolated as
unprofiled throughput.

`scripts/m5.4-x87-analyze.py` analyzes the bounded counters.
`scripts/m5.4-softfloat-profile.py` resolves simpleperf offsets against the
matching unstripped ELF and reports vCPU CPU-self samples. Anonymous JIT code
remains unresolved rather than being assigned to an invented helper.

### Executed opcode and helper distribution

The counter-profile run PID 9929 recorded **17,098,752 x87 instructions** and
**29,260,554 public x87 helper entries** in 5.000532 seconds. These are measured
rates of that instrumented run, not the final APK's instruction rates.

| Executed instruction | Count | Instructions/sec |
|---|---:|---:|
| FLD m32 | 4,093,071 | 818,527 |
| FSTP m32 | 2,696,122 | 539,167 |
| FMUL m32 | 2,584,337 | 516,812 |
| FADDP reg | 1,561,202 | 312,207 |
| FMUL reg | 1,037,554 | 207,489 |
| FSTP reg | 1,014,291 | 202,837 |
| FLD ST(i) | 998,545 | 199,688 |
| FADD reg | 543,395 | 108,667 |
| FSUB m32 | 542,088 | 108,406 |
| FILD m32 | 277,073 | 55,409 |
| FNSTSW AX | 196,593 | 39,314 |
| FCHS | 170,679 | 34,132 |
| FADD m32 | 163,172 | 32,631 |
| FDIVR m32 | 153,939 | 30,785 |
| FDIV m32 | 126,604 | 25,318 |
| FCOMP m32 | 121,856 | 24,369 |

There were no observed FLDCW/FNSTCW changes, transcendental arithmetic, or
FCOMI/FUCOMI instructions in this window. Counts for omitted rare instructions
are retained in ignored `x87-summary.json`; omission is not a claim about all
possible boot workloads. Every sampled control word was `0x027f`: 53-bit
significand precision, nearest-even rounding, all six exceptions masked.
This does **not** restrict x87's extended exponent range to binary64.

| Public helper | Calls | Calls/sec |
|---|---:|---:|
| fpop | 5,554,074 | 1,110,697 |
| flds_ST0 | 4,093,071 | 818,527 |
| flds_FT0 | 3,761,150 | 752,150 |
| fmul_ST0_FT0 | 3,720,579 | 744,037 |
| fsts_ST0 | 2,742,337 | 548,409 |
| fadd_STN_ST0 | 1,686,671 | 337,298 |
| fmov_FT0_STN | 1,534,381 | 306,844 |
| fpush | 1,147,451 | 229,466 |
| fmov_STN_ST0 | 1,014,291 | 202,837 |
| fmov_ST0_STN | 998,545 | 199,688 |
| fsub_ST0_FT0 | 608,128 | 121,613 |
| fadd_ST0_FT0 | 581,098 | 116,207 |

Important observed pairs include single-precision operand load -> multiply,
FADDP arithmetic -> pop, store conversion -> pop, and push -> register copy.
The source mapping is `target/i386/tcg/translate.c:gen_x87` and
`target/i386/tcg/fpu_helper.c`: FLD m32 -> `flds_ST0`; FMUL m32 ->
`flds_FT0` then `fmul_ST0_FT0`; FSTP m32 -> `fsts_ST0` then `fpop`;
FADDP -> `fadd_STN_ST0` then `fpop`. Conversions unpack FloatParts64, widen to
FloatParts128 and repack floatx80; subsequent arithmetic unpacks that value
again. Results round according to the unchanged x87 control state.
Each conversion/arithmetic helper separately saves/clears/merges flags.

The corrected arithmetic-operand run PID 20943 sampled 26,648 actual
arithmetic inputs: 21,254 normal finite (79.758%),
5,363 zeros (20.125%), and 31 NaNs
(0.116%). No subnormal, infinity or unsupported arithmetic
inputs were sampled. Normal plus zero inputs were 99.884%.
This is sampled input evidence, not proof that outputs avoid underflow/overflow
or that binary64 has equivalent x87 exceptions/exponent range. The earlier
ST0/FT0-at-opcode samples include unused/stale stack values and are not used as
arithmetic-operand statistics. All sampled control words again were `0x027f`.

### CPU-time attribution and limits

An independent seven-second 499 Hz `cpu-clock:u` simpleperf sample collected
6072 process samples in a profiling-disabled stack-candidate run, PID 18958.
Resolved **vCPU self samples** were: SoftFloat 37.30%, x87 helper bodies 15.34%,
anonymous translated code 36.54%, other 10.81%. The combined observed
SoftFloat/x87 helper share was approximately **52.65%**. This is statistical
CPU-self attribution, not exact wall time, and not a count of calls to every
internal normalization routine. It does not include an invented attribution
of anonymous translated code to x87.

Dominant vCPU samples were `parts64_uncanon_normal` 11.91%,
`floatx80_addsub` 6.67%, `floatx80_round_pack_canonical` 5.11%,
`floatx80_mul` 5.09%, `helper_flds_FT0` 3.86%, and `helper_flds_ST0` 3.83%.
The original per-helper monotonic timing method was rejected: an empty clock
pair averaged 186.48 ns, comparable to the measured operation. The ARM counter
probe also has a measurable floor (131.315 ns in PID 9929). Timer-subtracted
costs are estimates and are not summed into a causal frame budget or presented
as exact percentages. Internal `parts*` calls/sec, exact per-TB CPU costs,
and helper-ABI-only CPU time remain unmeasured.

The strongest evidence remains serial conversion, normalization, rounding,
and arithmetic, plus generated-code/helper boundary work. Low GPU utilization
is consistent with limited guest command production, not proof of a GPU wait
bottleneck. Even ideal elimination of the sampled 52.65% alone would not imply
60 FPS from a 19 FPS baseline; that extrapolation is only an Amdahl estimate,
not a performance forecast.

### Representative hot translated blocks

The bounded guest/TCG/host dump establishes concrete work rather than treating
an idle-loop PC as animation computation:

- `0x800582c0` implements three scalar vector additions: three repetitions of
  FLD m32, FADD m32, FSTP m32, followed by RET. There are 9 x87 instructions and
  15 original FPU helper boundaries, plus 9 profiling calls and lookup. The
  captured profiled translation has 149 TCG ops / 2068 host bytes (including
  literal data and diagnostic overhead); these are not baseline code-size
  measurements. A later translation has 152 ops / 2080 bytes.
- `0x80058c3e` begins a three-component multiply/accumulate sequence, then
  duplicates ST0, compares, and tests status. The captured translation has
  160 ops / 1944 host bytes, including profiling. It uses three memory
  multiplies and two FADDP/pop pairs. This is a useful arithmetic block.
- `0x800429d0` contains integer copy work, not x87; the captured block has
  61 ops / 696 host bytes. `0x80058cab` is a short integer block (25 ops /
  268 bytes). Their presence disproves treating all hot PCs as FP instructions.
- The previously sampled `0x800582b9` does not independently establish a full
  TB's start/cost. The bounded dump's `0x800582c0` block is the measured example;
  no invented per-PC instruction count is assigned to `0x800582b9`.

Representative existing IR:

```text
qemu_ld_i32 operand, address, ...
call flds_FT0, env, operand
call fmul_ST0_FT0, env
...
call fsts_ST0, result, env
qemu_st_i32 result, address, ...
call fpop, env
```

The dump also shows FIP/FDP/segment updates after each instruction and broad
register synchronization around generic helper calls. The ARM64 output uses
loads/stores, argument moves and indirect helper calls (`blr`), with guest
register spills/reloads. Host byte counts include pools and must not be divided
by four and called exact executed instruction counts. No ARM64 backend,
indirect lookup, affinity or renderer rewrite was justified by this evidence.

### Tested candidates and correctness

Two candidates were isolated with separate compile flags and excluded after
benchmarking. Their patches/source/tests are preserved only under ignored
`build/m5.4/rejected/x87-boundaries/`; they are **not in the ordered series**.

1. Integer TCG lowering of x87 push/pop and 80-bit register copies. Low 64 and
   high 16 bits are copied without numerical conversion; tags/top remain
   architectural. On ARM64, 1,310,720 comparisons against the original pinned
   helpers passed across all stack tops/indexes, aliasing, arbitrary 80-bit
   encodings, and control/status/tag preservation. It produced 17.24 FPS;
   a separately sampled run produced 17.28 FPS. No retained win.
2. Explicit stack-top helper operands, narrower TCG global-clobber contracts,
   and merging the two helper boundaries of a **single** memory arithmetic
   instruction. The original SoftFloat conversion, arithmetic, FT0 state and
   ordered exception merges remained intact. Register arithmetic was also
   tested with explicit operands. On Retroid ARM64, **5,242,880** state/result
   comparisons passed: all four precision-control encodings and rounding modes,
   masked/unmasked exceptions, randomized extended encodings, signed zero,
   subnormal, NaN/Inf and unsupported encodings. It produced 17.72 and 17.46
   unique FPS versus a contemporaneous committed-binary launch at 20.08 FPS.
   Correctness was necessary but no throughput benefit was demonstrated.

No native binary32/binary64 replacement or global precision reduction was
retained or reintroduced. Previous rejected per-operation fast paths were not
repeated. Passing narrow helper tests does not prove native FP equivalent for
whole extended-precision blocks. A future TB-local unpacked representation
would need explicit state-flush/exception/interrupt boundaries and a new
correctness proof; no such architecture was added in this iteration.

### Final validation of retained state

Final APK: `build/m5.4/BoxDroid-M5.4-arm64-v8a.apk`, package `org.boxdroid.m54`.
Profiling and rejected optimization flags are disabled. Guest timing still
selects 60 Hz / 16.6667 ms for active mode `0x20010101`.

| PID | Unique FPS | Presents/sec | Flips/sec | Duplicates | Mean change ms | vCPU % | PFIFO % | Fence ms | Acquire/submit/present |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| 15507 | 17.01 | 19.88 | 19.61 | 14.48% | 58.81 | 91.19 | 28.04 | 1.96 | 555/555/555 |
| 26471 | 17.51 | 21.12 | 20.84 | 17.09% | 57.12 | 91.77 | 27.23 | 1.97 | 554/554/554 |
| 31583 | 19.46 | 24.35 | 24.35 | 20.09% | 51.38 | 91.52 | 27.24 | 1.96 | 543/543/543 |

Mean unique FPS: **17.99**, versus the prior committed
checkpoint mean 19.00 and contemporaneous checkpoint launch 20.08. The
17.01–19.46 final range overlaps prior run variation; no throughput gain is
claimed. Mean changed-frame intervals remain 51.38–58.81 ms.

Each run physically captured genuine green animation (6 s), Xbox logo
(12 s) and the dashboard prompt (20 s), visually reviewed. Landscape,
640×480 -> 1440×1080 at (240,0) in a 1920×1080 surface, overlay and black
borders remain correct. Failed presents were zero; shutdown was clean;
crash buffers were empty. The inherited M4 JSON says FAIL because these
launches do not exercise its required recreation sequence; this is not a
failed M5.4 present. Present mode FIFO and four swapchain images were retained.

Final renderer fence means were 1.96–1.97 ms. No fence, synchronization,
concurrency, BQL, scheduling or affinity change was retained. Capacity
classes remained 351/871/1024; vCPU samples primarily use highest-capacity
CPU 7. One-second placement samples cannot establish every migration or
cycle of low-capacity residency.

Overlay samples overlapping the accelerated benchmark windows averaged
approximately 21/22/26% total-capacity CPU and 11.67/11.67/17% whole-device
GPU busy for the three runs, respectively. These windows include partial
phase boundaries; they are not exclusively green-animation samples or an
optimization claim. Main-loop BQL acquisition waits averaged approximately
6.92/7.91/6.70 ms per elapsed second. Mean changed-frame intervals above do
not establish frame-time percentiles or exact individual spike durations.

All four milestone packages remain installed. The unchanged M5.3 app was
relaunched (PID 5754), showed the same boot sequence, completed all presents
without failure, shut down cleanly and left an empty crash buffer. Shared
FP diagnostics compile out of M5/M5.2/M5.3; their installed APKs were not
overwritten.

Clean Android native build and Gradle build succeeded. A fresh pinned
reconstruction independently applied 0001–0017 in order; all 66
patch-touched files matched the final build tree. The diagnostic operand
guard correction was copied before final x87 compilation. ELF64/AArch64,
package/manifest checks, shell/Python syntax and `git diff --check` passed.
Pin and pre-existing upstream untracked files are unchanged. Generated
binaries, test evidence, performance logs and screen captures stay ignored.

### Remaining bottleneck and decision

M5.4 remains **PARTIAL**. This investigation characterizes the opcode mix,
public-helper frequency, repeated conversion/materialization and sampled
CPU-time distribution. It does not deliver a retained major performance gain
or the >=58 unique FPS target. The checkpoint's original FP semantics and
validated release profile remain intact. Exact all-helper latency, complete
TCG/x87 CPU attribution and a semantics-preserving TB-local decoded-state
implementation remain open work within M5.4, not M5.5 or M6.

## Final retained-path validation after interrupted-run continuation

The resumed run completed the pending TB-local candidate validation before any
device benchmark. The recognized vector add/subtract and three-term
multiply/accumulate chains reduced their original 15 FPU helper boundaries to
one compound TCG boundary; vector stores still used the exact conversion/store
helpers internally. A three-entry TB-local cache of validated ordinary-RAM
page mappings was then added to remove repeated guest-memory lookup overhead.
It cached mappings only, never values, and each store was re-probed.

Differential coverage passed with zero failures:

- 14,680,064 full architectural/memory comparisons for the compound chains.
- 1,048,576 mapping-cache comparisons, including changing RAM contents between
  repeated reads and partial-boundary/fault cases.

The mapping-cache device candidate measured 19.19 unique FPS in its proper
accelerated window, versus the earlier committed-path mean of 20.70 FPS. It
was rejected. No TB-local runtime candidate, native precision substitution,
reduced-precision path, polling wait, affinity change, fence removal or timing
change is retained.

The final retained-path validation used a fresh pinned-source build with the
TB-local candidate disabled. Its three fresh runs were:

| PID | Unique FPS | Presents/sec | Flips/sec | Duplicate rate | vCPU | PFIFO | Main/presenter | Fence mean | Acquire/submit/present | Failed presents |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---|---:|
| 29916 | 19.78 | 22.86 | 22.86 | 13.46% | 91.11% | 27.73% | 17.68% | 1.83 ms | 548 / 548 / 548 | 0 |
| 3922 | 19.67 | 24.73 | 24.73 | 20.44% | 91.38% | 26.78% | 19.55% | 1.92 ms | 546 / 546 / 546 | 0 |
| 9104 | 17.52 | 21.20 | 21.02 | 17.37% | 91.63% | 27.19% | 19.12% | 1.90 ms | 553 / 553 / 553 | 0 |

The mean was 18.99 unique FPS. All three showed the green animation, Xbox
logo and dashboard, with correct fitting, zero failed presents, clean shutdown
and empty crash buffers. The active NTSC-M target remains 60 unique FPS, so
M5.4 is still PARTIAL. The remaining high-value direction is a genuinely
TB-local x87 representation that removes repeated conversion and state
materialization without adding a per-access guest-memory cost.
