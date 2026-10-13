# Exact DOUBLE53 optimization

Follow-up to the corrected v8 candidate and main-to-candidate attribution.
Xemu remains pinned to `478b4f496102379c7eaa7f3ec10e714a703c4300`.
Only patch 0033 implementation changed; corrected 0032, corrected 0036 and
0034 remained fixed. Work completed in approximately 44 minutes.

## Implementation and correctness

The common path directly packs canonical, exactly binary64-representable
floatx80 operands in nearest-even DOUBLE53 mode with unbiased exponents in
[-450,450]. It accelerates add, subtract, multiply, divide and sqrt. Results
are normal or exact zero; neither exponent exceptions nor double rounding can
occur. Existing sticky-inexact handling is preserved; otherwise FPSR is
observed. Other domains retain the previous exact implementation.

Thin hot wrappers separate the unchanged general arithmetic bodies from the
common path. The common multiply wrapper uses a 64-byte frame, versus 208 bytes
in the first experimental build. Rare property lookup/auditing is separated
from the caller-owned runtime cache. No architectural control-word cache was
introduced. Runtime acceleration remains enabled.

Final focused differential tests: 28,700,080 comparisons, zero result or flag
mismatches. Existing broad suite: 816,594,864 comparisons across three precision
modes, four guest rounding modes and four host FPCR contexts, zero mismatches.
The helper-status harness passed 288 masked/unmasked FPUS/FWAIT cases and
independent-status runtime-control cache checks. Native compilation and ordered
patch-series verification passed.

## Matched performance

System Qualcomm Vulkan; four background workers; no owner participation;
normal scheduler; DSP interpreter; unchanged audio/rendering/game settings.
Fresh processes, 25-second warmup, 35-second capture. Native diagnostic profiles
were separate from cadence captures. Pandora used the same Dili bridge view;
Sega used the same Mustang/automatic/Iron City race view.

| Title | Reference flips/s | Optimized flips/s | Gain | Reference TCG CPU ms/flip | Optimized |
| --- | ---: | ---: | ---: | ---: | ---: |
| Pandora | 8.034 | 9.311 | 15.9% | 119.94 | 103.35 |
| Sega GT | 17.980 | 19.763 | 9.9% | 44.19 | 40.98 |

Pandora reference runs: 8.022 and 8.047; optimized runs: 9.411 and 9.212.
Changed-image rates equal these Pandora flip rates. Sega changed images/s:
18.008 reference, 19.763 optimized. Sega is one matched pair; naturally varying
rivals and progression limit precision. Host presentations are not gameplay FPS.
Classified FPU self samples fell from 30.7% to 21.9% of TCG samples.

Against historical M32+36 rates, Pandora remains 2.49% below 9.549 flips/s;
Sega is 3.24% above 19.142. These upper references were not freshly remeasured,
so this is indicative, not a matched legacy comparison or a new main-parity
validation. Earlier correction and attribution reports describe the pre-
optimization candidate and retain their historical results.

## Artifacts

Local ignored artifacts: `build/production-correction/fpu-timebox/` contains
source/patch snapshots, exact APK/ELF provenance, compiler output, focused and
broad test logs, summary.json and final-state.json. Per-run captures are under
`build/production-correction/captures/fpu-tb-*`. The existing committed x87
harnesses support reproducing the broad/status validation with the configured
Android native build. The final optimized APK was installed and hash verified;
profiling was disabled and the app stopped. Smaller conversion/status costs
remain; no further optimization was attempted.
