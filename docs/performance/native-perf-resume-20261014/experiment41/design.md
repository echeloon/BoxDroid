# Experiment41 lookup metadata latency

Diagnostic39 shared lookup container accounts7.53% TCG sampled weight; primary slot pointer and following TB header loads show stalls (sampling skid prevents exact cycle attribution). Emit key/hash/probe first, match full PC+generation using CSEL-to-null, and fetch immutable cs_base before debugger/mode/logging/flags eligibility checks. The late primary probe reuses the validated pointer and saved cs_base. Read mutable cflags/INVALID at its original late location. Secondary/C fallback unchanged. X9 is already clobbered by the generic lookup calling convention, not any private preserve_most helper.

Lifetime: fullkey before dereference preserves experiment36 stale-generation contract. cpu_exec RCU protects retained TB memory. Xbox machine max_cpus=1 in hw/xbox/xbox.c:486; TB generation/recycling cannot execute concurrently on another vCPU. Concurrent invalidators can clear slots/setINVALID, which is checked late; global code-cache reclamation remains exclusive. No invalidation or interrupt checks removed. Source proof and focused enabled/disabled stale-key/collision/CR3/SMC/fault/MMIO/IRQ tests pass. No universal-equivalence claim.

Enabled clean11.766946 at33.2C, matching disabled comparison pending; no gain claim.
