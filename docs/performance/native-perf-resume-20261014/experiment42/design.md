# Experiment42: sequence acquisition in TCG hash lookups

Evidence: diagnostic39 aggregates seqlock_read_begin self1.34% of all sampled process CPU (~2.8% TCG given TCG contribution), plus QHT comparator/lookup costs. Source shows sequence relaxed-load followed by read barrier. Test acquire-load entry while preserving final read barrier/retry and all writer locking/barriers/RCU.

Scope: new QHT_MODE_LOAD_ACQUIRE only enabled for TCG htable/inv_htable through qht_acquire1 at table initialization. Other QHT users, generic seqlock API, readers other than lookup, writers, resizing and lifetime remain unchanged. Default0. qht_read_begin acquire orders sequence before protected reads. Initial map/bucket accesses are already linked by the RCU pointer/address dependency; final seqlock_read_retry read barrier remains required and unchanged. Odd sequence rounds down to preceding even value, hence forces retry exactly as before. No guest memory/TLB ordering weakened.

Local authoritative semantics: include/qemu/atomic.h qatomic_load_acquire; docs/devel/atomics.rst lines143ff; include/qemu/seqlock.h original reader/writer. Passing stress tests is evidence, not proof; memory-model reasoning above is part of acceptance.

Focused harness adds three concurrent RCU readers and 65536 alternating insert/removes, explicit resizing, true-pointer validation and read-count assertion. It inherits the TCG table's selected mode. Full CPU CR3/fault/SMC/IRQ/ordering suite still runs. No result yet. Host source prepared while immutable installed experiment41 APK OFF comparison runs; no device work overlaps.
