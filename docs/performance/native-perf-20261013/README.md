# Native performance preservation checkpoint

This directory preserves the existing engineering run through experiment 26.
It does not introduce experiment 27 or change any acceptance decision.

## Source reconstruction

The pinned Xemu source is `478b4f496102379c7eaa7f3ec10e714a703c4300`.
`patches/xemu/series` now includes:

- `0037-native-perf-tcg-checkpoint.patch`: complete existing TCG candidate delta,
  including provisional/disabled paths. This is a preservation checkpoint.
- `0038-guest-flip-profile-timestamps.patch`: latest profile-only NV097 flip
  timestamp instrumentation, previously present only in generated source.

The original 36 patches are unchanged; `baseline-series.txt` and
`baseline-provenance.json` retain their identities. Android runtime overlays are
preserved in `native/android/core/`; the generated copies match them byte for
byte. `scripts/profile-android.py` preserves the corresponding parser and
metric labels. The existing focused harness is in
`scripts/tests/tcg-state-recovery.c` and `.py`.

`checkpoint.json` identifies patched/overlay source content and downstream
inputs. `reconstruction-verification.json` records comparison of an isolated
reconstruction against the generated source. To repeat only this filesystem
verification, use `python3 scripts/verify-native-perf-checkpoint.py`.
This command does not build, test guest execution, or access the device.

## Authoritative current state

`experiments.json` and the table below distinguish present, provisional,
disabled, and rejected experiments. `runtime-controls.json` records the actual
comparison controls, removed/ignored historical properties, and required active
candidate controls. Diagnostic controls are distinct from clean comparisons.

Experiment 23 is still present but disabled. Experiments 17/24/25 remain
provisional; this preservation does not certify their final acceptance.
Experiment 26 is removed; its focused regression infrastructure remains.
The latest guest-flip timestamp changes are preserved but not device-validated.
The latest installed APK (`shared-lookup-fixed`, SHA256
`0f7d9700f68d8e743d003b7b8504db550ca0a9a793d9265be3d5a322f78d8afe`)
predates those timestamp changes. No new APK was packaged during preservation.

Existing cadence evidence is approximately 9.3540 flips/s at baseline,
9.5804 in the baseline bracket, and up to 11.3945 with shared lookup/absolute PC
and TLB residency disabled. These are supporting submission-cadence metrics,
not a measurement of calibrated simulation speed or proof of native behavior.
TCG remains approximately 96% of one CPU; bottleneck migration is not established.
Audio still has material missing frames (~5% in recent captures).
Original-Xbox reference data is unavailable; certification remains UNRESOLVED.
The original engineering run has not reached a completion condition.

## Existing evidence and limitations

- `capture-record.json`: verbatim existing summaries and runtime metadata.
- `package-record.json`: candidate APK/native/source identities.
- `validation-record.json`: recorded harness/control identities and log availability.
- `evidence-index.json`: hashes and paths of every archived historical evidence file.
- `evidence.tar.gz`: original logs, results, diagnostics, source diffs, runtime
  snapshots, test/edit/measurement scripts, disassembly, perf capture data, and
  build configuration. Failed/stale/intermediate records remain historical,
  not accepted results. The old single-entry experiment-record.json is stale;
  experiments.json is authoritative for checkpoint state.
- `build-configuration.json` and `dependencies.json`: current build options,
  toolchain, source/dependency pins, and clean nested dependency state.
- `historical-tools/`: existing useful helper scripts copied as data, not executed
  during preservation; historical paths/options may require adjustment on resume.

Historical snapshots reproduce the recorded candidate source/runtime state.
Older test identities sometimes identify test-source hashes without preserving
that exact historical harness revision. Their logs and editor scripts are kept;
bit-for-bit reconstruction of every old test executable is not claimed.
The current harness source matches the latest archived fixed-suite identity.
APK/ELF binaries, section dumps and large raw TCG code-dump files remain under
ignored `build/` paths. They are not required to reconstruct the current source;
recorded identities and derived diagnostic evidence are preserved here. No
reproducible-binary claim is made for Android packaging timestamps/toolchain
outputs. Source preparation cannot erase this downstream checkpoint directory.

All downstream work remains local, uncommitted and partly untracked, as requested.
There is no commit/push/merge or remote backup. Preserve these files together
when moving or cleaning the repository; `git clean` could delete untracked files.

## Experiments 1–26

| # | Existing mechanism | State at checkpoint | Existing evidence |
|---|---|---|---|
| 1 | Inline exact MMX entry | present | 9.7274 first; 9.7549 clean repeat. Modest gain vs baseline anchors; group retention provisional. |
| 2 | CPU-local x87 stack/register operations | present | 9.7222; no isolated gain established. Kept as part of the CPU-local FP group. |
| 3 | Paired TLB comparator/addend loads | present | 9.8655; small difference, requires final group validation. |
| 4 | Private FP operand-pointer helper ABI | present | 9.6656; enables CPU-local helpers and later ABI changes. Full-state focused comparisons archived. |
| 5 | Deferred global canonical stores at scalar memory operations | rejected and removed | Fixed on/off 9.7787/9.6447; insufficient standalone/group benefit. Initial REP/boot mismatch corrected before rejection; history preserved. |
| 6 | Preserve live caller registers only in memory cold paths | rejected and removed | On/off 9.5900/9.7553; instruction reduction negligible, no net gain. Experiments 5/6 removed together. |
| 7 | Pure condition-code helper memory contracts | present | 9.89265; focused differential state evidence archived. |
| 8 | Direct SSE memory-to-XMM lowering | present | 9.89307; alignment and precise-fault guards retained. |
| 9 | Private read-TLB cache | rejected and removed | 9.69388 initial; cache off/on 9.92063/9.92088. No established gain; invalidate/transition test evidence retained. |
| 10 | CPU-local SSE helper contracts | present | Remains after experiment 9 removal; isolated contribution unresolved. Gather/mask paths retain generic contracts. |
| 11 | Guarded exact-domain packed MULPS native path | present, controlled by sse_native=1 | On/off 9.97933/9.64535. Scalar exact fallback retained; 65,536 focused oracle comparisons archived. |
| 12 | Same-register SHUFPS broadcast lowering | present | 10.00351; all selectors/aliases focused comparisons archived. |
| 13 | Affine normal-RAM access span grouping | rejected and removed | On/off 9.92062/10.09070. Later comparison with FP group also did not justify retention. |
| 14 | CPU-local F32 operand-pointer helpers | present, controlled by fp_local=1 | 9.68935 with then-current span group; enables experiments 15/16. Exact old helpers remain. |
| 15 | Exact integer normal/zero F32 widening and representable F80 narrowing | present | 10.43085 span off. All difficult encodings/rounding/status cases retain conservative paths. |
| 16 | preserve_most F32 helper ABI and TCG caller-clobber contracts | present, controlled by fp_preserve=1 | Span off/on 10.65798/10.58259; rejected spans removed. Common/fallback full64 register ABI checks archived. |
| 17 | Secondary two-slot TB jump cache | present, provisional, jmp_cache2=1 | On/off 10.34674/10.17577; stronger final attribution remains pending. Invalidation covers both caches. |
| 18 | Generated inline indirect TB-cache lookup | present, controlled by inline_lookup=1 | On/off 10.444213/10.175897. Debug/architecture eligibility guards and original state/call-clobber contracts retained. |
| 19 | Move dispatcher-transition barriers to cache-miss path | present, controlled by lookup_no_bridges=1 | 10.713931 first, temperatures differ. Guest memory ordering not removed; concurrent visibility checks archived. |
| 20 | Vector acquire-pair cache loads | rejected and removed | On/off 10.372390/10.684379; slower. |
| 21 | Copied inline FMUL exact fast path | rejected and removed | 10.389087 first; experiment 21/22 group did not improve cadence. |
| 22 | Conditional live caller-register cold-save ABI for experiment 21 | rejected and removed | Group on/off 10.443052/10.572924; no workload cold-save coverage. Forced-pressure correctness harness remains useful. |
| 23 | Shared preserve_most exact FMUL leaf helper | present, disabled, provisional: fmul_shared=0 | On/off 10.402199/10.334001 with matching battery temperature; gain unestablished. Preserved faithfully without promotion to accepted optimization. |
| 24 | Existing absolute-PC TCG translation mode | present, provisional: tcg_absolute_pc=1 | On/off 10.802272/10.637121 (~1.55%); confirmation pending. Alias/exception/SMC/interrupt-focused checks archived. |
| 25 | Shared generated indirect lookup routines | present, provisional: lookup_shared=1; publication fix included | On/off 11.167992/10.459151; repeat on 11.376308. Corrected early publication on duplicate-TB rollback; fixed focused suite archived. Final matched comparison/broad validation unfinished. |
| 26 | Two pinned host registers for TLB descriptor residency | rejected and removed | On/off 11.077427/11.394535; slower. Forced-resize MOVSD and duplicate-publication regression tests preserved after runtime rollback. |
