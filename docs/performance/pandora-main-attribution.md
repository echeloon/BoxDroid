# Main-to-candidate performance attribution

## 1. Exact configuration matrix

Main is `origin/main` at `1a2385a9817e7d862cefb17358deb2da1c0e6bf3`.
Candidate is the frozen corrected v8 source on `pandora-tcg`, HEAD
`191008108dc04a7de5a7f3d235b9c726e2f37bd3`, with its uncommitted corrections.
All variants use Xemu `478b4f496102379c7eaa7f3ec10e714a703c4300`.

| Configuration | 0032 | 0033 | 0036 |
| --- | --- | --- | --- |
| M | Exact main | Exact main | Absent, as on main |
| M32 | Corrected | Main | Absent |
| M33 | Main | Corrected | Absent |
| M32+33 | Corrected | Corrected | Absent |
| M36 | Main | Main | Corrected |
| M32+36 | Corrected | Main | Corrected |
| M32+33+36 | Corrected | Corrected | Corrected |

The four requested ladder variants identify path-dependent marginal effects.
M33 and M36 identify interactions with the main baseline. M32+36 was added
only after the first matrix showed a 0032/0033 interaction, to measure 0033's
cost with both other corrections already present. M33+36 was not measured;
there is no full eight-configuration factorial campaign.

## 2. Source/runtime controls used

Variants are exact patch-selected builds: main's 35-patch series, replacing only
selected patches with the frozen corrections and adding corrected 0036 where
specified. Expected temporary Git indexes matched generated source before
compilation. The same source/build paths, NDK compiler, O3, ThinLTO,
dependencies, native runtime, app and frontend were retained. Each packaged
native text section matches its archived ELF. Production patch files were never
changed. Compiler layout changes caused by a selected patch are included in
that implementation's measured cost; build settings do not vary.

A runtime legacy-ownership switch would require alterations throughout dispatch,
worker admission and guest mutators, so it was not used as an approximation of
main. Disabling the candidate FPU or selecting its conservative ordering mode
would also not reconstruct actual main behavior.

All runs used System Qualcomm Vulkan, four background voice workers, no APU
owner participation, DSP interpreter, normal Android scheduler, unchanged
rendering/audio/game settings and clocks. Controls: `fast_fpu=1`,
`voice_coarse=0`, `tcg_ordered=4`, `voice_workers=4`, `voice_apu=0`, `dsp_jit=0`,
`tcg_prime=0`, `async_present=1`. Controls absent from a main implementation have
no effect there. Heavy diagnostics were zero; light performance/audio counters
were enabled. Every variant starts a fresh app/emulator process.

Each title ran M / M32 / M33 / M32+33 / M36 / full / M, 45-second warmup and
40-second cadence captures. M32+36 followed separately. The second M exposes
drift. Each non-final anchor was followed by a separate 15-second native
profile, excluded from cadence numbers. Pandora is the same Dili bridge view;
Sega is the same Mustang/automatic/normal/Iron City/two-lap/five-rival race view.
Sega's naturally varying rival roster and scheduler placement are limitations.

Separate diagnostic APKs add six-second, CPU-owned counters to the actual FPU
fast/fallback returns and generated completed memory accesses. They preserve
numerical code and barriers; reserved ARM64 x16/x17 scratch registers are used
for RAM counters and NZCV is unchanged. Diagnostic cadence is never used for
performance attribution. Probe overhead can affect dynamic workload mix, so
counts corroborate mechanisms rather than predict uninstrumented FPS.

## 3. Pandora results

| Configuration | Guest flips/s | Changed images/s | Host presents/s | TCG / APU / PFIFO CPU % | Changed-image p50 / p95 / p99 ms | Missing audio | Ownership calls ms/s |
| --- | ---: | ---: | ---: | --- | --- | ---: | ---: |
| M | 9.040 | 9.040 | 18.061 | 97.74 / 53.79 / 17.65 | 112.00/128.28/132.26; 111.99/128.24/131.61 | 3.822% | 0.00 |
| M32 | 8.606 | 8.606 | 17.238 | 95.97 / 53.01 / 16.53 | 112.04/141.08/144.19 | 4.292% | 15.56 |
| M33 | 7.564 | 7.564 | 15.145 | 97.32 / 53.73 / 14.61 | 128.04/144.91/160.16 | 2.623% | 0.00 |
| M32+33 | 7.441 | 7.441 | 14.924 | 96.49 / 53.53 / 14.46 | 128.16/159.86/160.19 | 3.335% | 14.13 |
| M36 | 9.921 | 9.921 | 19.861 | 97.75 / 53.09 / 19.22 | 96.06/115.47/129.58 | 4.485% | 0.00 |
| M32+36 | 9.549 | 9.549 | 19.069 | 96.01 / 53.39 / 18.09 | 98.98/128.12/132.05 | 4.813% | 16.99 |
| M32+33+36 | 7.961 | 7.961 | 15.900 | 96.24 / 54.14 / 15.17 | 127.97/145.25/160.18 | 4.232% | 15.48 |

M uses the mean of its two anchors: 9.003 and 9.077 flips/s (+0.82% endpoint change). Its two percentile triplets above are separate runs, not a pooled distribution. The full candidate is -11.94% below this matrix's M mean.

Host presentations include repeated images; they are not gameplay FPS. Changed-image intervals are not simulation-tick latency. Dropped audio frames and failed presentations were zero in all accepted cadence captures. Audio fractions use their own actual requested-frame windows. Ownership-call timing includes mutex overhead, unlocks and internal handoffs; it is an upper bound on blocking, not exclusively sleep.

M battery readings: [[29.2, 29.2], [32.7, 32.7]]. CPU frequencies and per-sensor thermal peaks are archived with every run. No clocks or placement policy were changed.

FULL battery readings: [[32.2, 32.5]]. CPU frequencies and per-sensor thermal peaks are archived with every run. No clocks or placement policy were changed.

## 4. Sega results

| Configuration | Guest flips/s | Changed images/s | Host presents/s | TCG / APU / PFIFO CPU % | Changed-image p50 / p95 / p99 ms | Missing audio | Ownership calls ms/s |
| --- | ---: | ---: | ---: | --- | --- | ---: | ---: |
| M | 18.684 | 18.672 | 34.893 | 86.90 / 35.47 / 48.38 | 57.92/88.43/95.89; 57.52/82.82/91.23 | 33.091% | 0.00 |
| M32 | 16.863 | 16.888 | 32.522 | 79.48 / 35.36 / 41.14 | 61.21/86.89/99.56 | 33.971% | 80.21 |
| M33 | 16.369 | 16.369 | 32.631 | 86.65 / 36.30 / 42.66 | 64.06/83.94/91.42 | 33.180% | 0.00 |
| M32+33 | 14.225 | 14.249 | 28.284 | 79.17 / 36.17 / 37.95 | 67.01/98.20/103.21 | 31.819% | 67.45 |
| M36 | 22.228 | 22.228 | 33.561 | 92.95 / 35.75 / 56.07 | 46.82/91.05/97.67 | 33.889% | 0.00 |
| M32+36 | 19.142 | 19.167 | 33.533 | 81.60 / 35.52 / 49.43 | 58.47/90.57/102.75 | 34.039% | 78.79 |
| M32+33+36 | 15.976 | 15.976 | 31.531 | 81.01 / 35.80 / 40.97 | 64.93/87.32/100.12 | 33.622% | 74.04 |

M uses the mean of its two anchors: 19.123 and 18.245 flips/s (-4.59% endpoint change). Its two percentile triplets above are separate runs, not a pooled distribution. The full candidate is -14.49% below this matrix's M mean.

Host presentations include repeated images; they are not gameplay FPS. Changed-image intervals are not simulation-tick latency. Dropped audio frames and failed presentations were zero in all accepted cadence captures. Audio fractions use their own actual requested-frame windows. Ownership-call timing includes mutex overhead, unlocks and internal handoffs; it is an upper bound on blocking, not exclusively sleep.

M battery readings: [[33.2, 33.2], [36.0, 36.0]]. CPU frequencies and per-sensor thermal peaks are archived with every run. No clocks or placement policy were changed.

FULL battery readings: [[35.7, 35.7]]. CPU frequencies and per-sensor thermal peaks are archived with every run. No clocks or placement policy were changed.

### Operating-state and progression evidence

| Title/config | CPU policy median MHz (0 / 4 / 7) | Battery start/end °C | Peak CPU sensor °C |
| --- | --- | --- | ---: |
| Pandora M | 1171/2419/2842; 1171/2419/2842 | 29.2/29.2; 32.7/32.7 | 81.0 |
| Pandora M32 | 1171/2419/2842 | 30.2/30.2 | 77.1 |
| Pandora M33 | 1171/2419/2842 | 30.7/31.0 | 78.7 |
| Pandora M32+33 | 1171/2419/2842 | 31.2/31.5 | 78.7 |
| Pandora M36 | 1171/2419/2842 | 31.7/31.7 | 81.4 |
| Pandora M32+36 | 1171/2419/2842 | 36.0/36.0 | 84.1 |
| Pandora M32+33+36 | 1171/2419/2842 | 32.2/32.5 | 81.4 |
| Sega M | 1171/2419/2842; 1171/2419/2842 | 33.2/33.2; 36.0/36.0 | 87.2 |
| Sega M32 | 1171/2419/2842 | 33.7/34.0 | 86.8 |
| Sega M33 | 1171/2419/2842 | 34.5/34.5 | 88.4 |
| Sega M32+33 | 1171/2419/2842 | 35.0/35.0 | 86.4 |
| Sega M36 | 1171/2419/2842 | 35.2/35.5 | 91.5 |
| Sega M32+36 | 1171/2419/2842 | 35.7/36.0 | 87.2 |
| Sega M32+33+36 | 1171/2419/2842 | 35.7/35.7 | 88.8 |

Frequency medians are samples, not proof of identical instantaneous clocks. Per-sensor thermal observations remain in capture summaries.

| Sega configuration | Observed game seconds per wall second |
| --- | ---: |
| M | 0.3183 |
| M32 | 0.2839 |
| M33 | 0.2748 |
| M32+33 | 0.2447 |
| M36 | 0.3680 |
| M32+33+36 | 0.2683 |
| M | 0.3094 |
| M32+36 | 0.3196 |

OCR reads four monotonic race timer values over about 30 seconds in every Sega capture. This independently confirms the cadence direction. Pandora evidence is guest flips and animated bridge-view screenshots; no independently calibrated simulation timer was available. Changed-image hashes are not simulation ticks.

The earlier 60-second campaign found Pandora -10.6% and Sega -17.9%.
The diagnostic matrix remeasures the same APKs/settings/scenes with shorter
windows. Its marginals decompose its own measured gap; they are estimates of
the earlier gaps, not an exact assignment of historical frame counts. Sega's
anchor variation limits precision for small interactions. No extrapolation to
other scenes or titles is claimed.

## 5. Marginal cost of corrected 0032

Pandora: M → M32 -0.434 flips/s (-4.80%), or +5.573 effective wall ms/flip. TCG CPU work changes +3.391 ms/flip; ownership calls add 1.808 ms/flip.

Sega: M → M32 -1.821 flips/s (-9.75%), or +5.779 effective wall ms/flip. TCG CPU work changes +0.622 ms/flip; ownership calls add 4.756 ms/flip.

CPU work plus ownership-call wall time explains much of the measured cost,
but the windows differ slightly and these terms do not establish an exact
sleep/CPU accounting identity. Patch 0032 also changes admission, handoff and
IRQ/notifier behavior. Its whole marginal should not be labeled pure waiting.

## 6. Marginal cost of corrected 0033

Pandora, M->M33: -1.476 flips/s (-16.32%), +21.578 wall ms/flip, +20.536 TCG CPU ms/flip.

Pandora, M32->M3233: -1.166 flips/s (-13.54%), +18.204 wall ms/flip, +18.166 TCG CPU ms/flip.

Pandora, M3236->FULL: -1.588 flips/s (-16.63%), +20.892 wall ms/flip, +20.350 TCG CPU ms/flip.

Sega, M->M33: -2.315 flips/s (-12.39%), +7.569 wall ms/flip, +6.424 TCG CPU ms/flip.

Sega, M32->M3233: -2.639 flips/s (-15.65%), +11.001 wall ms/flip, +8.524 TCG CPU ms/flip.

Sega, M3236->FULL: -3.166 flips/s (-16.54%), +10.354 wall ms/flip, +8.084 TCG CPU ms/flip.

The last contrast holds corrected ownership and ordering fixed, directly
measuring the FPU cost in the fully corrected context. Native profiles use raw
leaf event periods, whose sums are checked against the recorded event total.
Rounded 0.01% rows for thousands of JIT addresses and overlapping Children
percentages are not summed as CPU costs.

| Title/config | FPU fraction of TCG raw self samples | Estimated FPU CPU ms/flip in separate native window |
| --- | ---: | ---: |
| Pandora M | 14.62% | 16.01 |
| Pandora M32 | 14.89% | 16.92 |
| Pandora M33 | 28.68% | 37.46 |
| Pandora M32+33 | 28.43% | 37.23 |
| Pandora M32+36 | 14.93% | 15.15 |
| Pandora M32+33+36 | 30.07% | 37.21 |
| Sega M | 12.78% | 5.54 |
| Sega M32 | 12.57% | 6.09 |
| Sega M33 | 25.42% | 13.57 |
| Sega M32+33 | 24.55% | 13.71 |
| Sega M32+36 | 12.11% | 4.93 |
| Sega M32+33+36 | 25.72% | 13.62 |

Counter windows below distinguish fallback from accelerated integer, hardware,
and certified-hardware paths. Integer acceleration is not a hardware FPU
instruction. Precision codes: 0=extended/64 significant bits, 1=double/53,
2=single/24; rounding codes 0=nearest-even, 1=down, 2=up, 3=toward zero.
Counters classify 14 operation groups covering the accelerated APIs. Legacy
hardware flag observation is not implemented in main, so its separate
observed/unobserved counters are not applicable.

| Title/config | Calls counted | Reference fallback % | Integer-fast % | Hardware-fast % | Certified-fast % | Host observed / unobserved calls |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| Pandora M | 109,550,905 | 3.4213% | 47.0835% | 49.4952% | 0.0000% | n/a |
| Pandora M32 | 105,877,846 | 3.4632% | 47.1914% | 49.3454% | 0.0000% | n/a |
| Pandora M33 | 90,705,856 | 0.0168% | 71.2984% | 28.6848% | 0.0000% | 0 / 26,018,797 |
| Pandora M32+33 | 91,566,587 | 0.0170% | 71.3125% | 28.6705% | 0.0000% | 0 / 26,252,585 |
| Pandora M36 | 120,404,367 | 3.4280% | 47.1025% | 49.4694% | 0.0000% | n/a |
| Pandora M32+36 | 116,946,774 | 3.4430% | 47.1445% | 49.4125% | 0.0000% | n/a |
| Pandora M32+33+36 | 98,692,827 | 0.0169% | 71.3170% | 28.6661% | 0.0000% | 0 / 28,291,392 |
| Sega M | 60,372,656 | 5.6035% | 51.4533% | 42.9432% | 0.0000% | n/a |
| Sega M32 | 62,804,562 | 5.4299% | 51.5596% | 43.0105% | 0.0000% | n/a |
| Sega M33 | 56,747,245 | 0.0000% | 79.4194% | 20.5806% | 0.0000% | 0 / 11,678,934 |
| Sega M32+33 | 47,449,980 | 0.0000% | 80.3331% | 19.6669% | 0.0000% | 0 / 9,331,952 |
| Sega M36 | 79,519,015 | 4.4671% | 52.2902% | 43.2427% | 0.0000% | n/a |
| Sega M32+36 | 61,440,094 | 5.5653% | 51.4250% | 43.0097% | 0.0000% | n/a |
| Sega M32+33+36 | 48,970,700 | 0.0000% | 80.2685% | 19.7315% | 0.0000% | 0 / 9,662,665 |

The dominant measured precision mode and status-observation evidence are:

Pandora M: DOUBLE53 accounts for 98.505% of counted calls; accelerated coverage is 96.5787%.

Pandora M33: DOUBLE53 accounts for 98.498% of counted calls; accelerated coverage is 99.9832%.

Pandora M32+33+36: DOUBLE53 accounts for 98.496% of counted calls; accelerated coverage is 99.9831%.

Corrected counter windows distinguish accelerated computation from reference fallback. A decrease in hardware-instruction share can reflect increased exact integer acceleration.

Sega M: DOUBLE53 accounts for 96.495% of counted calls; accelerated coverage is 94.3965%.

Sega M33: DOUBLE53 accounts for 96.467% of counted calls; accelerated coverage is 100.0000%.

Sega M32+33+36: DOUBLE53 accounts for 96.345% of counted calls; accelerated coverage is 100.0000%.

Corrected counter windows distinguish accelerated computation from reference fallback. A decrease in hardware-instruction share can reflect increased exact integer acceleration.


The logger missed the start marker in sega/M32. Complete end markers, elapsed durations and operation/memory rows were captured; no diagnostic guest-flip normalization is reported for those windows.

Per-operation, precision and rounding distributions are preserved in
`attribution-diagnostic/counter-analysis.json`; aggregate totals do not replace
those distributions.

## 7. Marginal cost/benefit of corrected 0036

Pandora, M->M36: +0.881 flips/s (+9.74%), -9.822 wall ms/flip.

Pandora, M3233->FULL: +0.520 flips/s (+6.99%), -8.780 wall ms/flip.

Pandora, M32->M3236: +0.943 flips/s (+10.95%), -11.469 wall ms/flip.

Sega, M->M36: +3.544 flips/s (+18.97%), -8.532 wall ms/flip.

Sega, M3233->FULL: +1.752 flips/s (+12.31%), -7.707 wall ms/flip.

Sega, M32->M3236: +2.279 flips/s (+13.52%), -7.060 wall ms/flip.

| Title/config | Ordered scalar reads / writes | Ordinary scalar reads / writes | Slow scalar reads / writes | Vector total reads / writes | Slow vector subset reads / writes |
| --- | --- | --- | --- | --- | --- |
| Pandora M | 0 / 0 | 218,045,892 / 127,032,028 | 499,726 / 578,856 | 2,202,816 / 658,059 | 1,526 / 1,074 |
| Pandora M32 | 0 / 0 | 213,113,207 / 124,266,037 | 483,754 / 579,840 | 2,148,185 / 645,156 | 1,377 / 1,050 |
| Pandora M33 | 0 / 0 | 185,738,054 / 108,953,859 | 424,842 / 495,776 | 1,842,494 / 553,685 | 1,113 / 903 |
| Pandora M32+33 | 0 / 0 | 186,815,138 / 109,540,752 | 424,349 / 511,338 | 1,852,707 / 557,199 | 1,163 / 903 |
| Pandora M36 | 234,997,366 / 137,926,686 | 0 / 0 | 3,781,797 / 1,143,302 | 2,422,055 / 724,571 | 1,625 / 1,184 |
| Pandora M32+36 | 228,560,807 / 134,045,179 | 0 / 0 | 3,717,455 / 1,125,347 | 2,356,604 / 705,187 | 1,528 / 1,157 |
| Pandora M32+33+36 | 197,433,439 / 116,531,819 | 0 / 0 | 3,123,314 / 1,003,775 | 2,010,926 / 603,250 | 1,220 / 984 |
| Sega M | 0 / 0 | 147,480,156 / 98,278,113 | 231,903 / 160,742 | 10,195,985 / 3,527,680 | 1,888 / 1,615 |
| Sega M32 | 0 / 0 | 152,537,795 / 101,448,815 | 233,755 / 164,387 | 10,473,910 / 3,617,926 | 1,546 / 1,720 |
| Sega M33 | 0 / 0 | 143,957,554 / 96,477,144 | 232,373 / 164,230 | 10,060,323 / 3,502,242 | 1,301 / 259 |
| Sega M32+33 | 0 / 0 | 128,741,105 / 87,777,259 | 218,544 / 150,444 | 9,115,349 / 3,167,438 | 1,626 / 1,460 |
| Sega M36 | 169,946,379 / 110,733,944 | 0 / 0 | 1,626,600 / 241,873 | 11,503,585 / 3,983,836 | 1,702 / 719 |
| Sega M32+36 | 150,087,105 / 101,004,898 | 0 / 0 | 1,281,258 / 230,950 | 10,591,035 / 3,662,100 | 1,819 / 827 |
| Sega M32+33+36 | 130,716,227 / 89,831,482 | 0 / 0 | 1,199,081 / 204,643 | 9,434,116 / 3,267,741 | 1,358 / 596 |

These are completed generated-access counts during each diagnostic window,
not counts of guest instructions, hardware CPU memory operations or DMBs.
Vector slow counts are subsets of vector totals and must not be added again.
They exclude accesses performed internally inside C helpers. Counts/rates from
probe APKs are not substituted for uninstrumented performance measurements.

## 8. Interaction effects

Interactions are evaluated on effective wall ms/flip, `1000 / guest flips/s`.
FPS percentage gains cannot be added. The ladder's absolute FPS differences and
its wall-time differences each telescope to its measured net change.

| Interaction on wall ms/flip | Pandora | Sega |
| --- | ---: | ---: |
| 32x33_ms | -3.374 | +3.431 |
| 36x32plus33_ms | +1.042 | +0.825 |
| 32x36_ms | -1.647 | +1.472 |
| 33x36_given32_ms | +2.688 | -0.647 |

The requested ladder decomposes the net loss in absolute flips/s (these columns sum):

| Title | 0032 | 0033 after 0032 | 0036 after 0032+33 | Net |
| --- | ---: | ---: | ---: | ---: |
| Pandora | -0.434 | -1.166 | +0.520 | -1.079 |
| Sega | -1.821 | -2.639 | +1.752 | -2.708 |

Definitions: I32×33 = t32+33 - t32 - t33 + tM;
I36×(32+33) = (tFull - t32+33) - (t36 - tM);
I32×36 = t32+36 - t32 - t36 + tM;
I33×36 given 32 = tFull - t32+36 - t32+33 + t32.
Negative interaction reduces the summed isolated cost. The last conditional
interaction cannot separate a pure 33×36 term from a three-way term without
M33+36. Small terms, especially in Sega, should not be called statistically
significant from this limited diagnostic matrix.

## 9. Dominant cause of the regression vs main

Corrected 0033 is the largest measured added CPU-work cost. Corrected 0032
adds a separate waiting/handoff cost, materially larger in Sega. Corrected
0036 is beneficial in both titles and offsets part of those costs; it does not
cause the net regression. Native raw samples corroborate the FPU work increase.
The counter interpretation must distinguish aggregate coverage from expensive
work within accepted accelerated paths.

Native profiles identify `boxdroid_f80_arithmetic`, `boxdroid_f80_scaled`,
`boxdroid_f64_scaled`, `boxdroid_f80_precision` and `boxdroid_f80_narrow` among
the added FPU work. The counter coverage establishes that increased reference
fallback is not the dominant mechanism in these scenes. Status observation,
precision selection, scaling and packing should not be conflated into one
unmeasured cost: the samples localize work but do not time each separately.

## 10. Performance potentially recoverable

| Title | Measured conditional FPU cost, wall ms/flip | Wall ms/flip needed for parity with matrix M | Fraction of measured FPU cost needed | Legacy-FPU context FPS budget |
| --- | ---: | ---: | ---: | ---: |
| Pandora | 20.892 | 14.997 | 71.78% | +1.588 |
| Sega | 10.354 | 9.073 | 87.63% | +3.166 |

This is an experimentally measured opportunity budget, **not a guaranteed safe
recoverable gain**. M32+36 contains main's legacy FPU behavior, including its
known correctness defects. Reproducing its speed by restoring that behavior
is not an accepted optimization. Attribution alone cannot establish an exact
safe replacement cost; no replacement was implemented or measured here.

## 11. Recommended next engineering target

**0033: reduce work in the dominant exact normal-number arithmetic/conversion
paths**, guided by precision/operation coverage and raw native samples. Preserve
full-significand correctness, rounding, exceptions and fallback domains. The
next work should target scaling, packing and status/eligibility bookkeeping;
it should not disable acceleration or restore main's approximate results.
No such optimization is included in this attribution work.

## 12. Final Git/device state

Implementation hashes remain frozen: 0032 `4ba542defa73f8afc8d734edf0c8b4feb11197f4b50e6ec019bff804dc1fe7e1`,
0033 `1a9278457c092f9aac8111bb2f6845d1f4ac38751d32aa0744a9b4b266c47fa4`,
0036 `60b816502757c161a553c6c0e43f6a723fc2752350aa2c43437ac204b7d33bbb`.
0034 remains `35ac940618f86e446c03cb809e3f05c40f32014d40217664c80527c534024497`.
Temporary instrumentation lives in ignored build artifacts; generated production
source is restored and validates against the complete frozen patch series.
No source correction, optimization, branch switch, commit, push or merge occurred.

The branch remains pandora-tcg at the same HEAD. Existing changes remain
uncommitted and unstaged. The only additional tracked-workspace deliverable is
this attribution report and its documentation link. Final cleanup restored the
original candidate-v8 APK, verified its installed SHA256, restored production
controls, set diagnostics/profile/attr_window to zero and stopped the app. The upstream checkout, main and patch series remain
unchanged. Final state verification is recorded with the artifacts.

Artifacts under `build/production-correction`: attribution/results.json,
attribution-extra/results.json, attribution/analysis.json, diagnostic counter
windows and analysis, per-run metadata/samples/screenshots, original raw native
profiles, per-variant patch selection/provenance and exact APK/ELF pairs.
