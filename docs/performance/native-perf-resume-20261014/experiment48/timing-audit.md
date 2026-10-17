# Proposed diagnostic timing gate

Scope: three existing per-operation diagnostic timers only. No runtime or generated source was edited to prepare this artifact. The root agent provides `bool boxdroid_diag_timings_enabled(void)` and latches `detailed_diagnostics || debug.boxdroid.diag_timings=1` before `qemu_init()`.

## Behavior

- BQL: the lock call and assertions are unchanged. Only enabled acquisitions write timing TLS and read the clock. Unlock reads the clock and emits timing logs only for a nonzero `hold_begin`, then clears it. The actual mutex unlock always runs once. With the default disabled startup state, zero-initialized TLS stays zero. No dynamic runtime toggle is supported.
- Softmmu MMIO store: `io_prepare`, the BQL guard, and exactly one `int_st_mmio_leN` call are preserved. Enabled mode runs the existing timing/log sequence; disabled mode invokes the original operation directly under the same guard. Exceptions/longjmp still escape the same operation; no exception is caught or replayed.
- PGRAPH register write: PFIFO lock remains before PGRAPH lock. One latched diagnostic flag gates the three host-clock samples and diagnostic log. Register/device execution after the locks is unchanged.
- `GUEST_FLIP` timestamps and GPU draw timing are untouched. Real locks, MMIO, watchpoints, readbacks, dirty tracking, and guest clocks are untouched.

## Reversible comparison

Restart the same APK with diagnostics=0 and diag_timings=1 to select legacy diagnostic timing, or diagnostics=0 and diag_timings=0 for the candidate. Hold the independent vram_watch control fixed. diagnostics=1 always keeps timing enabled. All controls are startup-latched.

## Review/validation limits

Artifact was generated from the current experiment47 source and checked with `git apply --check`; it was not applied, compiled, installed, tested, profiled, or benchmarked. Needed downstream validation: enabled/disabled MMIO/exception/device cases, ordinary BQL operation, stable scene check, and same-APK guest-progress measurement. Profiling attribution from preserved39 suggested these timers are secondary to the diagnostic VRAM watch; no speedup is claimed.
