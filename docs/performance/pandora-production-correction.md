# Pandora production correction

Correction candidate v8 on `pandora-tcg`, starting at
`191008108dc04a7de5a7f3d235b9c726e2f37bd3`. Xemu remains pinned to
`478b4f496102379c7eaa7f3ec10e714a703c4300`. No commits, branches or upstream
checkout changes are part of this correction. Patch 0034 is unchanged.

## 0032: voice ownership

The original atomic bitmap prevented torn bitmap updates. It did not stop an
already selected worker from using a voice after `VOICE_LOCK` returned. That
allowed guest descriptor updates, `VOICE_ON`, filter clearing and `src_reset`
to race descriptor, filter and resampler accesses.

The replacement owns each voice across queue admission and processing. A redundant
UNLOCK is idempotent: it clears the guest bit without touching a worker
reservation. The earlier development assertion incorrectly rejected this
legal command; the final ownership tests include it.

The handoff protocol is:

1. A brief ownership mutex protects an active bitmap and the admission decision.
2. Guest lock requests set the guest bit before checking the active bit. This
   excludes new admissions. An active voice completes before its targeted
   condition variable releases the guest request.
3. Batch admission is all-or-none. A dispatcher waiting for guest-owned A never
   retains B, which the guest might need before releasing A.
4. A worker releases its voice immediately after `voice_process`, before mixing
   and DSP completion. Guest updates therefore wait for that voice's processing,
   rather than the whole APU frame.
5. Processing descriptors and implicit guest mutators use the same ownership
   protocol. The frontend reads shared ACTIVE/NEXT control words under a brief
   list mutex; it can observe an inactive voice and raise its idle event while
   the guest holds a processing lock. ON publishes its link/active transaction
   only after filter initialization, with no ownership wait holding the list lock.
6. OFF, PAUSE, ON and unlock events advance a control generation. Blocked batch
   admission retries its original selected sequence, excluding stopped
   voices. Paused jobs retain their cohort positions and existing early return. A guest-owned stopped voice cannot stall frontend/IRQ progression.
   These voices perform no processing by architectural command; live work remains.
7. A dispatcher blocked on guest ownership releases the APU frame mutex before
   sleeping. VM pause obtains that mutex, cancels admission and wakes the waiter.
   The ownership mutex is released before reacquiring the frame mutex.
8. Worker shutdown joins before ownership conditions are destroyed. Pool
   reconfiguration preserves ownership and runs at the existing quiescent point.

Repeated occurrences retain one reservation until all jobs finish. An ordinal
orders occurrences of the same voice across workers; their original assignment
and multipass grouping remain intact. Paused jobs retain their cohort positions. Only workers waiting for that voice wake.
Every worker queue follows collection order, and an ordinal waits only for an
earlier collected job, so these dependencies cannot form a cycle. The normal
single-occurrence path needs no additional worker-entry mutex.

The happens-before handoff is the ownership mutex unlock/lock around clearing
and observing the active bit. The guest bitmap alone is not the handoff.
The single guest CPU serializes guest requests. Normal production has one APU
dispatcher waiter and one condition per voice; workers are not broadcast awake.
The diagnostic VP monitor claims all voices because its peek reads other voices.

Notifier payload is written before its final status byte, with a write barrier
before status publication. IRQ requests are now release-published and consumed by atomic exchange before
the APU drops its frame lock for the BQL update. A request posted during that
update survives for the next iteration, and worker writers do not race a plain
Boolean clear.

`debug.boxdroid.voice_coarse=1` is a conservative comparison control that adds
the old frame mutex around guest ownership calls. Default zero uses targeted
ownership. Restart the core when changing this control.

### Tests and measurement scope

`scripts/tests/run-voice-ownership.py` tests the actual patch header with pthread
equivalents of QEMU mutexes and conditions under ThreadSanitizer. It covers a
lock while active, a queued batch conflicting with a guest lock, an unrelated
voice remaining active, rapid lock/unlock, reset stand-ins, 16 workers and 1,000
pause/cancellation interleavings and 1,000 stop-event/admission-retry handoffs
while the guest lock remains held. Repeated jobs also start in reverse order
to verify sequencing and final ownership release. `--android` also uses real `SRC_STATE` instances
with concurrent processing/reset under ownership. Both passed 100,000 guest
handoffs without a race, deadlock or lost wakeup.

With performance profiling enabled, `APU_VOICE_WAIT` reports time inside guest
thread ownership calls. This includes mutex overhead, internal handoffs and
unlock calls; it is an upper bound on blocking time, not exclusively time asleep.
The matched development comparison with FPU acceleration off and conservative
ordering measured 154.85 ms/s for coarse calls versus 13.07 ms/s for targeted
calls, and 5.060 versus 6.309 guest flips/s. Maximum call time was 6.013 versus
3.868 ms. Final v8 Pandora captures measured 15.54 and 14.40 ms/s, with maximum
calls 5.175 and 4.586 ms. Sega measured 82.02 and 82.24 ms/s, with maximum calls
7.002 and 5.716 ms. Sega issues about 5,200 guest ownership calls per second;
these totals include every call, rather than just sleeps. Coarse serialization
was not restored. The checkpoint bitmap’s zero wait counter is not an ownership
baseline: it returns without waiting for an active worker.

## 0033: exact floatx80 acceleration

The checkpoint already excludes extended precision from accelerated add,
multiply and divide. Its remaining unsafe domains are specific: single precision
rounding uses a 36-bit discard mask instead of the required 40 and always adds
half an ulp; full-width inputs are truncated through binary64 in arithmetic and
conversions; square root still admits extended precision; integer conversions
and FRNDINT can lose decisive low bits; and numerical fast paths omit newly
raised exception flags. Widening from f64/i64 also bypasses the pinned API's
selected result precision. Exponent-only comparison guards admit noncanonical
encodings. The replacement expands exact extended arithmetic beyond the
checkpoint's guarded SoftFloat paths while correcting these domains.

Every new accelerated path first requires a canonical finite normal with its
explicit integer bit set, or signed zero. NaNs, infinities, denormals,
pseudo-denormals and unsupported encodings use the pinned SoftFloat code.
Exceptions are committed only after eligibility and result guards pass.

| Operation | Exact accelerated domain | Reference fallback |
| --- | --- | --- |
| Compare / quiet compare | Full 64-bit canonical normals and signed zeros, integer comparison | Every special/noncanonical encoding |
| f32 widening | Normal finite binary32 and signed zero, exact bit construction | Subnormals and specials |
| f64 / i64 widening | Exact bit construction followed by selected precision rounding where the pinned API requires it | Special binary64 encodings / rejected bounds |
| f80 to f32/f64 | Integer rounding of the full significand in all four rounding modes, normal destination or signed zero | Destination subnormal, overflow, special/noncanonical input |
| f80 to i32/i64 | Integer rounding of the full significand, representable signed destination, all four modes | Invalid/range cases and special/noncanonical input |
| FRNDINT | Exact integer rounding, or direct selected precision rounding when the precision grid is at least one integer unit | Specials, unsupported encodings, precision overflow |
| Add/subtract | Exact identities; proven-exact binary64 when aligned significand width plus possible carry is at most 53; scaled binary32/binary64; exact 128-bit alignment/addition for full-width operands with exponent difference at most 64 | Large exponent separation outside hardware domain; exponent boundaries |
| Multiply | Exact identities; proven-exact binary64 when operand significand widths sum to at most 53; scaled binary32/binary64; exact 64 by 64 significand product in 128 bits | Exponent boundaries / special inputs |
| Divide / sqrt | Exact identities; scaled binary32/binary64; hardware estimate certified and rounded using exact integer residuals for full-width operands | Invalid operation, exponent boundaries, failed estimate certification |

Single precision means **24 significant bits**, double 53 and extended 64.
Integer rounding handles ties to even and exponent carry. The single-precision
hardware path operates directly in binary32 when both inputs have at most 24
significant bits. A binary64 result at a binary24 midpoint falls back when its
inexact provenance could cause double rounding.

Proven-exact binary64 addition/subtraction and multiplication can serve extended
precision and directed guest rounding without FPSR inspection. They operate on
exactly represented operands with a result-width proof, then apply integer guest
precision rounding. This also preserves useful hardware operations when PC is
extended; full-width cases still use the 128-bit exact implementation.

Hardware binary64 results with inexact status are accepted directly only in
nearest-even double precision, or in single precision after the midpoint guard.
Extended or directed results use an exact path or SoftFloat. Direct hardware results require nearest-even host rounding and disabled traps.
FZ and default-NaN settings are harmless in the guarded scaled-normal domain:
addition/subtraction cancellation is at least 2^-24 or 2^-53, and multiply,
divide and sqrt remain in [.5,4]. Inputs and nonzero results are normal. Certified
estimates may also use any host rounding mode; their guest result is determined
by integer certification and rounding. Unrecognized FPCR settings fall back.
Checked binary32/binary64 arithmetic saves, clears, reads and restores FPSR;
only inexact is accepted in these scaled normal domains.

The runtime enable/poll cache belongs to `float_status`, alongside the exception
flags already owned by the caller. The Xbox CPU statuses are zero initialized;
copies carry this private performance cache without caching precision or
rounding rules. It is not serialized guest state. This replaces Android dynamic
TLS resolution on every operation, which sampled at 3.90% of total process CPU
time in the v5 profile (0.36% in the checkpoint). Independent-status OFF/ON
refresh tests check that controls never alter result bits or exception flags.

### Certified extended divide and square root

The hardware result is an estimate, never the guest result. For division an
integer numerator N and divisor B certify `q*B <= N < (q+1)*B`. For square root,
`q*q <= N < (q+1)*(q+1)`. A bounded estimate correction is followed by these
exact inequalities; failure uses SoftFloat. The residual determines exactness
and whether the fraction lies below, at or above half an extended ulp. Together
with the full integer floor it also determines rounding to 24 or 53 bits.
For integer N, square root cannot be exactly `q+1/2`; its half-ulp decision is
`N-q*q > q`. Final selected precision rounding is integer arithmetic.

Basic arithmetic helpers may preserve a preexisting inexact flag only when
guest FPUS precision is already sticky and the control word masks precision
exceptions. In that case reconstructing the same sticky precision flag is
sufficient, and these normal domains cannot create another exception. Clearing
FPUS or unmasking precision restores exception observation. Transcendental
helpers retain their original clear/merge behavior because they inspect newly
raised precision flags during refinement.

### Differential and status tests

`run-x87-differential.py` compiles actual candidate SoftFloat and separately
renames symbols from the pristine pinned reference. It compares 17 operations,
result bits and all SoftFloat flags across three precision modes, four rounding
modes, clear and preexisting flags. Targeted pairs precede deterministic random
24-, 53- and 64-bit significands across the extended exponent range. Inputs
include `1 + 2^-24`, `2 - 2^-30`, ties, carry, cancellation, destination bounds,
signed zeros, NaNs, infinities, subnormals and unsupported encodings.

The latest four full-width runs passed **816,594,864 comparisons** with **zero
mismatches**, covering normal host FPCR, altered host rounding, flushing, and
flushing plus default NaN. There were 434,084,258 fast-path hits in total. Hits
include integer paths; this count is not a count of hardware FPU instructions
and is not a gameplay fast-path fraction.

`run-x87-status.py` links the actual x87 helpers. It passed 288 cases covering
masked/unmasked FPUS, old software flags, sticky precision, FCLEX and FWAIT,
including 96 expected exception traps. Numerical tests cover overflow, underflow,
invalid, divide-by-zero, denormal and precision flag equivalence; helper tests
specifically check the software-to-guest status merge.

## 0036: ordered ARM64 RAM paths

The original patch incorrectly used `!CF_PARALLEL` to remove both generated
memory barriers and helper ordering. One guest CPU does not exclude device/I/O
threads accessing RAM. QEMU's `c914d46d0a` history explicitly addresses this
system-emulation requirement. The guest default memory order remains x86 TSO,
and helper `cpu_req_mo()` is restored exactly.

For ordinary guest operations TSO requires Load→Load, Load→Store and Store→Store.
Store→Load may relax. The optimized normal-RAM path uses STLR stores and LDAPR
loads where the host advertises LRCPC, otherwise LDAR. Android feature detection
adds only LRCPC; unrelated backend features are unchanged.

The closure invariant is: **every observable guest RAM read completes with
acquire ordering before the next translated guest access.** Scalar aligned reads
acquire directly. Ordinary unaligned/vector/helper reads acquire through a
post-read DMB ISHLD. Unknown helpers have a full entry barrier as well as this return bridge:
block helpers such as FXSAVE can use ordinary pointer stores without passing
through `cpu_req_mo()`. Those stores must not pass an earlier release store.
The entry bridge applies to conservative/parallel TBs and comparison mode too.
An explicit
whitelist of CPU-state-only x87 helpers cannot read guest RAM. C-to-JIT entries
bridge reads done by interrupts, exceptions, translation and other C paths.
Consequently direct TB chaining needs no per-TB entry barrier. Conservative
parallel TBs still complete reads with acquire ordering.

STLR supplies ordering from all prior loads/stores to the current store. An
ordinary vector store retains DMB ISHST; prior reads already acquire. Unaligned
inline stores use DMB ISHST plus the original store. Store-only comparison mode
uses full DMB for its unaligned stores because its reads do not have the acquire
invariant. The pinned i128 store request spells `STLD | STST`, omitting Load→Store.
For the Xbox TSO lowering this is normalized to `LDST | STST` before reduction:
comparison modes with ordinary reads therefore get a full barrier, while the
default acquire-read mode may reduce it to Store→Store. Explicit x86 fences and
atomic operations retain upstream handling.

| Path | Ordering and handling |
| --- | --- |
| Aligned scalar TLB hit | LDAPR/LDAR and STLR; original sign extension and byte swapping |
| Inline unaligned RAM | Original ordinary load followed by ISHLD; ISHST before store |
| Alternate alignment lowering | Natural alignment included in the existing TLB comparator; original helper MemOp on failure |
| TLB miss / MMIO / dirty tracking / watchpoint / cross-page | Original helper and `cpu_req_mo`; acquire bridge on normal return |
| Store helper | Original prefix ordering plus a return acquire bridge, because a page walk or MMIO callback can read RAM |
| Vector load | Original atomicity implementation plus ISHLD at the shared return point |
| Vector store | Store→Store barrier, original atomicity implementation; helper read bridge on slow return |
| Exception/fault exit | Original exit; next C-to-JIT entry bridges prior C reads |
| Explicit fence / atomics | Upstream ordering retained |
| TB boundary / chaining | Prior guest reads already acquire; no assumption that RAM has a single observer |

Natural alignment is required by LDAR/STLR. The inline variant explicitly checks
it after the unchanged TLB checks. The alternate variant incorporates it in the
existing comparator. The MemOp passed to helpers remains unchanged, so an x86
unaligned access remains legal. This changes lowering, not the TLB layout.

RCpc deliberately permits the store-forwarding Store→Load relaxation. It is
safe here because every subsequent guest store is release or barrier-ordered;
an ordinary later store without that guarantee would invalidate this reasoning.
See [Arm's RCpc explanation](https://developer.arm.com/community/arm-community-blogs/b/tools-software-ides-blog/posts/enabling-rcpc-in-gcc-and-llvm)
and [Arm's partial-order example](https://developer.arm.com/community/arm-community-blogs/b/architectures-and-processors-blog/posts/when-a-barrier-does-not-block-the-pitfalls-of-partial-order).
This is an architectural argument about the emitted instruction sequences,
supported by tests, rather than a proof inferred from a game's successful boot.

### Ordering tests and controls

`run-arm64-order.py` extracts the production backend's instruction encoding
expressions, generates executable ARM64 accesses and stresses CPU→device and
device→CPU payload/publication patterns at byte, halfword, word and doubleword
widths. A publication observed with stale payload is forbidden. Load buffering
also checks the forbidden mutual `1/1` result, including helper-read bridges and
release/store-forwarding/RCpc combinations and ordinary helper publication after
a translated release store. The latest test passed **12.8 million
iterations with zero forbidden outcomes**. These are backend ISA-contract tests,
not an emulated x86 litmus program. A vector load-buffering case also checks
ordinary reads followed by a full barrier and an STP store; a source assertion
checks the corresponding production MemOp requirement. Real translated gameplay blocks are inspected
separately; gameplay exercises the actual CPU/device paths.

`debug.boxdroid.tcg_ordered` is latched once per process:

| Value | Lowering |
| --- | --- |
| 0 | Upstream generated / cpu_req_mo ordering, plus conservative unknown-helper entry bridges |
| 1 | STLR scalar stores, upstream loads |
| 2 | LDAR/STLR, inline unaligned RAM |
| 3 | LDAPR where supported, otherwise LDAR; inline unaligned RAM |
| 4 (default) | Same acquire/release instructions, natural alignment in the TLB comparator |

Force-stop and restart the app process when changing it; translated blocks
never mix runtime modes without invalidation. Restarting a core within the same
process does not reset the static mode latch. Helper ordering stays enabled in every mode.

`order_audit=2` is a bounded diagnostic: arm `order_audit_run=1` only after
gameplay is established. It retains PCs and counts, not TB pointers, and dumps a
current RCU-protected block after 64 observed executions. Static counts include
cold unaligned/helper branches and must not be treated as executed barrier counts.
Code dump and PC sampling are disabled in performance measurements.

### Real translated hot block

The bounded audit recaptured PC `0x3f805` from the final v8 APK in both modes
after 64 observed executions in Pandora mission gameplay: 80 guest instructions. Complete dumps contain 2,087 ARM64
words for conservative mode and 2,088 for the optimized mode. Before the final
indirect jump, the aligned TLB-hit region contains **49 DMB** in the reference,
versus **2 DMB + 28 LDAPR + 20 STLR** in the candidate. Its code shrinks from
6,420 to 6,232 bytes. The candidate's whole-block static count is 50 DMB because
it includes cold helper-return bridges. Those are not 50 barriers on the aligned
path. The historical 80/34 block was a different measurement and is not used as
this matched before/after count.

Representative aligned scalar accesses from those dumps (TLB lookup omitted):

```asm
// Conservative TSO
 dmb ish
 str wzr, [x17, w21, uxtw]
 // next TLB lookup...
 dmb ishld
 ldr w21, [x17, w21, uxtw]

// Optimized ordered RAM
 add x30, x17, w21, uxtw
 stlr wzr, [x30]
 // next TLB lookup...
 add x30, x17, w21, uxtw
 ldapr w21, [x30]
```

This is valid with the acquire closure across all reads and helper/entry
transitions described above. A local substitution without that closure would
not establish the ordering contract. Natural alignment folds into the TLB
comparator; slow paths receive the original guest MemOp.

## Performance validation

### Independent controls, performance development build

Six 40-second captures used the same v4 candidate APK, fresh Dili bridge gameplay,
45-second warmup, System Qualcomm Vulkan driver, four background voice workers,
owner participation off, scheduler unchanged, identical audio/render settings.
Bounded ownership timeout auditing was enabled for these development runs;
code dumps, PC sampling and heavy diagnostics were off. Version v5 additionally
made redundant UNLOCK idempotent. Final v8 also
removes FPU dynamic TLS overhead and corrects conservative i128 store ordering;
these development rows are not final-v8 measurements. The coarse control is
a correct ownership baseline with the frame mutex added, not the unsafe bitmap.

| Controls | Guest flips/s | Changed images/s | Host completed presents/s | Guest ownership calls ms/s | Missing audio frames |
| --- | ---: | ---: | ---: | ---: | ---: |
| Coarse + SoftFloat + reference ordering | 5.060 | 5.060 | 10.141 | 154.85 | 4.39% |
| Targeted ownership only | 6.309 | 6.309 | 12.630 | 13.07 | 2.71% |
| Exact FPU only | 5.382 | 5.382 | 10.754 | 160.29 | 4.60% |
| Ordered RAM only | 5.481 | 5.481 | 11.000 | 157.45 | 4.53% |
| Targeted + exact FPU + reference ordering | 6.498 | 6.498 | 12.996 | 14.17 | 3.31% |
| All corrections | 7.341 | 7.341 | 14.659 | 13.27 | 2.90% |

Isolated throughput differences from the conservative baseline are +24.69%
for ownership, +6.38% for exact FPU and +8.33% for ordered RAM. With ownership
and FPU already enabled, ordered RAM adds 12.98%. These are single short
measurements, not confidence intervals or additive contributions. All six
produced audio and guest flips through the end of gameplay; dropped audio
frames and failed presentations were zero. Audio counter windows cover
20.5–31.5 seconds within each capture, so percentages use their own request
counts rather than the full capture duration.

Targeted ownership calls total 13.07 ms/s versus 154.85 ms/s in the isolated
comparison, a 91.56% reduction. Maximum individual call time was 3.868 ms
versus 6.013 ms. TCG occupancy rose from 82.88% to 96.85% of one CPU, showing
that ownership handoff released guest CPU time rather than simply relocating
APU work. In the combined run TCG/APU/PFIFO occupancy was 96.78/54.42/13.99%.
CPU policy median frequencies were 1.1712/2.4192/2.8416 GHz; battery temperatures
across these runs were 29.7–32.5 C. Sensor peaks are recorded separately; battery
temperature is not a CPU temperature. No clocks or affinity were changed.

The combined changed-image interval p50/p95/p99 was 131.120/160.114/162.290 ms.
This is an image cadence distribution, not measured simulation-tick latency.
Host presentation count is approximately twice guest flips because of repeated
presentations. No simulation-speed percentage is inferred from frame counts.

### Later isolated controls and rejected alternatives

The final v8 APK measured 8.011 guest flips/s with exact FPU enabled versus
7.738 with it disabled, with targeted ownership and ordered RAM unchanged:
**+3.53%**. Hardware acceleration remains enabled. This is one matched 40-second
comparison, not a repeated estimate. The same APK's STLR-only mode measured
7.646; the default acquire/release lowering was faster.

The v7 APK, with the same final FPU implementation, measured 8.036 with ordered
RAM versus 7.193 with conservative ordering: **+11.72%**. Its later v8 change
strengthens the conservative vector-store edge; default aligned scalar lowering
is unchanged. Label this a development comparison, not a final repeated result.

An alternative that sank an ISHLD immediately before ordinary RAM reads after
private TLB lookup passed its ISA tests but lost throughput: 6.969 versus 7.143
flips/s, **-2.43%** in the same experimental APK. It was removed. STLR-only
lowering was also rejected as the default. Profiling exposed the avoidable
Android TLS cost; moving enable caching into caller-owned float_status improved
short-run throughput from roughly 7.1–7.3 to 8.0. That cross-version observation
is suggestive; the final campaign below uses exact APKs and alternating runs.

### Alternating checkpoint validation

Each title used REFERENCE / CANDIDATE / REFERENCE / CANDIDATE, with 45 seconds
of gameplay warmup and 120 seconds per capture. Reference is the committed
checkpoint, not a correctness oracle. Candidate is final v8. Heavy diagnostics,
code auditing, PC sampling, ownership timeout auditing and FPU auditing were
zero. Lightweight performance/audio counters remained enabled.

Both builds used System Qualcomm Vulkan, four background voice workers, owner
participation off, DSP interpreter, normal Android scheduler and unchanged
render/audio configuration. Pandora started the Dili mission at the same bridge
view. Sega used Ford Mustang, automatic transmission, normal difficulty, Iron
City, two laps and five rivals. Its rival roster varies naturally between fresh
races; it is a regression control, not an exact instruction-trace replay. Final
numbers use stationary views within active gameplay; movement and transitions
were checked separately. These are not splash, trailer or menu captures.

| Title/run | Guest flips/s | Changed images/s | Host completed presents/s | Changed-image p50 / p95 / p99 ms | Missing audio |
| --- | ---: | ---: | ---: | --- | ---: |
| Pandora reference 1 | 10.504 | 10.504 | 21.006 | 95.990 / 114.959 / 120.159 | 4.681% |
| Pandora candidate 1 | 8.061 | 8.061 | 16.129 | 127.939 / 144.299 / 150.658 | 4.085% |
| Pandora reference 2 | 10.607 | 10.607 | 21.215 | 95.975 / 113.839 / 121.142 | 4.944% |
| Pandora candidate 2 | 8.069 | 8.069 | 16.131 | 127.929 / 144.148 / 159.690 | 4.217% |
| Sega reference 1 | 26.955 | 26.930 | 36.338 | 27.738 / 84.450 / 92.601 | 35.563% |
| Sega candidate 1 | 18.099 | 18.091 | 33.550 | 60.760 / 86.652 / 100.352 | 34.042% |
| Sega reference 2 | 26.823 | 26.773 | 36.100 | 28.209 / 84.271 / 92.170 | 34.798% |
| Sega candidate 2 | 18.651 | 18.651 | 34.271 | 59.251 / 85.612 / 94.379 | 33.652% |

The paired means are **Pandora 10.555 → 8.065 flips/s (-23.60%)** and
**Sega 26.889 → 18.375 (-31.66%)**. Changed-image means are respectively
10.555 → 8.065 and 26.851 → 18.371. Host completed presentations are
21.110 → 16.130 and 36.219 → 33.911; repeated presentation is not gameplay FPS.
Percentiles above measure changed-image intervals, not guest-flip latency or
simulation-tick latency. No averaging of percentiles into a pooled distribution
is claimed. Pandora checkpoint runs had maximum gaps of 312 and 1,424 ms;
candidate maxima were 176 ms. The candidate's slower typical cadence remains
real despite that improvement in the worst observed gap.

| Title/build mean | TCG CPU % of one CPU | APU CPU % | PFIFO CPU % |
| --- | ---: | ---: | ---: |
| Pandora reference | 97.60 | 53.10 | 19.71 |
| Pandora candidate | 96.28 | 53.38 | 15.82 |
| Sega reference | 90.56 | 35.08 | 53.93 |
| Sega candidate | 79.42 | 35.58 | 41.10 |

Reduced PFIFO occupancy accompanies fewer guest flips; it is not evidence that
PFIFO's work per guest frame improved. Pandora TCG remains near one CPU, while
its approximate measured TCG CPU time per flip rises from 92.5 to 119.4 ms.
These samples include the entire TCG thread; they cannot assign the whole
remaining loss to a single helper or barrier.

CPU policy medians were 1.1712 / 2.4192 / 2.8416 GHz, with occasional lower
policy4 samples and higher policy0 samples recorded. Battery temperature rose
from 32.5 to 36.2 C across the campaign. No clocks or affinity were changed.
Alternation reduces drift but does not make thermal conditions exactly equal;
battery readings are not CPU temperature. Per-sensor peaks and frequency
samples are saved with each run.

### Audio and simulation progression

Audio stayed RUNNING at 48 kHz, two-channel S16LE, burst 192, buffer 384,
capacity 1,536. All eight runs reported audio error zero, dropped frames zero
and failed host presentations zero. Guest flips and produced audio continued
through the end; no crash, hang, deadlock or Vulkan device loss was observed
in the captured runs. Screenshots retained normal gameplay HUDs. This is bounded
validation, not a claim about every title or long play session.

Aggregated audio counters across the two captures per build:

| Title/build | Requested frames | Produced/offered | Consumed | Missing | Dropped | Missing/requested |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Pandora reference | 10,848,000 | 10,326,272 | 10,325,824 | 522,176 | 0 | 4.814% |
| Pandora candidate | 9,864,000 | 9,454,336 | 9,454,528 | 409,472 | 0 | 4.151% |
| Sega reference | 10,416,000 | 6,753,280 | 6,753,408 | 3,662,592 | 0 | 35.163% |
| Sega candidate | 10,824,192 | 7,160,576 | 7,160,576 | 3,663,616 | 0 | 33.847% |

Audio counter windows are 102.5–113.5 seconds per run, rather than all 120
seconds; percentages use actual requests. Queue occupancy explains small
production/consumption differences. Pandora missing fraction improved from
4.81% to 4.15%; Sega from 35.16% to 33.85%. There is no measured new underrun
regression, but Sega's absolute audio starvation remains severe. Counters do
not prove subjective audio quality or sample-by-sample waveform equivalence.

Sega's on-screen TOTAL TIME advanced monotonically in every saved progression
sample. Reference progressed 48.670 and 48.431 game seconds over approximately
110 wall seconds; candidate 32.202 and 33.482. Game/wall rates were
0.4425 / 0.4404 versus 0.2928 / 0.3044. This is independent evidence of slower
race simulation, not merely a hash-count change. Neither source clocks nor
guest timing were modified. Both builds run below real-time in this scene.

Final v8 controller tests used the physical Xbox controller input device.
Holding A for 12 wall seconds accelerated the Sega car from the stationary
race view to **86 km/h**. START paused the race; RETRY and confirmation returned
through loading to LAP 1/2 with the race timer reset and audio RUNNING. Pandora
left-stick movement for 12 wall seconds moved Sam to the ledge and advanced
the tutorial prompt to “Press Y at the base of a ledge to grab onto it.” START,
LOAD GAME / LEVELS / DILI, explicit CONTINUE, loading and briefing START returned
to the initial mission HUD with audio RUNNING. Saved screenshots show coherent
world geometry before/after movement and after reloading. An initial automation
attempt selected the confirmation dialog's default CANCEL; it was corrected
by selecting CONTINUE. This was menu navigation, not a core hang.

Evidence directories are `navigation/final-v8-sega-input` and
`navigation/final-v8-order-mode4`, including action timestamps, retry/reload
results and screenshots. These separate checks are excluded from final cadence
numbers. Changed
images alone are not simulation ticks; Pandora has no equivalent timer
measurement in these captures, so no numerical Pandora simulation-rate claim
is made.

### Direct comparison with current origin/main

On 2026-10-12, `git ls-remote origin refs/heads/main` confirmed
`1a2385a9817e7d862cefb17358deb2da1c0e6bf3`, matching the local tracking ref.
An exact main native build was reconstructed from that commit's 35-patch series
against the unchanged Xemu pin. Its expected Git index matched the generated
source before compilation. Native/app/frontend source files outside the patch
series match main. The same optimized compiler configuration and dependencies
were used. The candidate source and native library were restored afterwards;
the branch, authoritative patches, upstream checkout and main ref were unchanged.

Main APK SHA256:
`c79fee3fa7de6ec94738d80b16f837fabdce1ea768ac1e389456f64fa924636c`.
Its packaged native `.text` matches the archived main ELF:
`7fe4126785274639e2a26f3ab747bbf0588853c163b495a68fcfb9d7f137c6df`.
Candidate is the same verified final v8 APK used above. Main contains the old
0032 and 0033 implementations and has no 0036; a candidate control with ordering
disabled would not be an exact main build.

Each title used MAIN / CANDIDATE / MAIN / CANDIDATE, with fresh verified gameplay,
45-second warmup and 60-second captures. System driver, four background voice
workers, no APU owner participation, DSP interpreter, scheduler, rendering and
audio settings were unchanged. Heavy diagnostics were disabled. Sega's naturally
varying rival roster and scheduler placement remain limitations. These shorter
captures are a separate campaign from the checkpoint comparison above.

| Title/run | Guest flips/s | Changed images/s | Host completed presents/s | Changed-image p50 / p95 / p99 ms | Missing audio |
| --- | ---: | ---: | ---: | --- | ---: |
| Pandora main 1 | 8.961 | 8.961 | 17.912 | 111.995 / 130.238 / 142.044 | 4.531% |
| Pandora candidate 1 | 8.036 | 8.036 | 16.079 | 127.937 / 144.383 / 159.554 | 3.731% |
| Pandora main 2 | 8.978 | 8.978 | 17.976 | 111.996 / 129.539 / 132.118 | 4.632% |
| Pandora candidate 2 | 8.003 | 8.003 | 16.012 | 127.954 / 144.438 / 160.041 | 4.353% |
| Sega main 1 | 20.371 | 20.371 | 36.438 | 50.496 / 89.876 / 94.865 | 34.490% |
| Sega candidate 1 | 16.046 | 16.062 | 31.466 | 64.426 / 86.956 / 99.360 | 33.542% |
| Sega main 2 | 19.336 | 19.320 | 37.349 | 51.504 / 75.020 / 87.376 | 32.859% |
| Sega candidate 2 | 16.544 | 16.560 | 31.703 | 63.950 / 87.992 / 98.977 | 33.318% |

| Title | Main mean guest flips/s | Candidate mean | Candidate change | Main → candidate missing/requested audio |
| --- | ---: | ---: | ---: | ---: |
| Pandora | 8.970 | 8.019 | -10.60% | 4.576% → 4.038% |
| Sega | 19.854 | 16.295 | -17.93% | 33.674% → 33.430% |

Battery temperatures ranged 31.2–34.5 C; frequency and thermal samples are
saved per capture. TCG migrated across cores in Sega with normal scheduler
placement retained. All eight captures reported zero audio errors, dropped
frames and failed host presentations, and ended in verified gameplay.

Sega's on-screen TOTAL TIME advanced monotonically in every progression sample.
Across approximately 50 wall seconds, main advanced 16.957 / 15.894 game seconds
and candidate 13.386 / 13.916. Game/wall rates were 0.3391 / 0.3178 versus
0.2677 / 0.2783. These independently support slower simulation progression in
the candidate. Timer readings and images are archived in
`main-clock-summary-v8.json` and the per-run navigation directories.

**Answer: NO. The corrected candidate is not at least as fast as current main
in the tested gameplay scenes.** Pandora's repeated deficit alone establishes
that conclusion. The improvements in correctness and the useful wins against
conservative controls remain valid. Changing the comparison from the checkpoint
to main reduces the measured performance deficit; it does not remove it.

Artifacts: `main-validation-v8-results.json`, `main-summary-v8.json`,
`main-validation-v8-*` captures/navigation, `origin-main-provenance.json` and
`origin-main-build` source/build logs under `build/production-correction`.

### Remaining performance gap and merge assessment

The corrections retain a useful fast common path, and each wins against its
correct conservative comparator. They do **not** meet checkpoint throughput.
Exact full-significand rounding/status work and ordered CPU/device RAM access
perform work that the unsafe checkpoint omitted. The saved controls quantify
benefits against correct baselines; they do not cleanly apportion the final
23.60% / 31.66% loss against the unsafe checkpoint among all three corrections.
Calling that entire loss unavoidable would go beyond the evidence. The sunk
barrier and store-only alternatives lost, and the measured TLS overhead was
removed; this is the best validated candidate implemented here, not proof of
optimality.

- **0032: MERGE-READY.** Exclusive handoff and low targeted waits are validated;
  no return to frame-wide serialization.
- **0033: MERGE-READY.** Defined exact domains, useful hardware acceleration,
  result/flag differential coverage and actual-helper status tests pass.
- **0036: MERGE-READY.** Ordered RAM is cheaper than the conservative path,
  generated/helper transitions retain the required ordering, and architectural
  reasoning is supported by backend tests and real translated blocks.
- **pandora-tcg: NOT READY TO MERGE under the requested performance objective.**
  The combined candidate has a material gameplay/simulation regression and
  checkpoint parity has not been achieved or shown technically unattainable.
  This is a performance acceptance gap, not a newly demonstrated correctness
  defect in the final three patches. No fallback-only solution or unsafe mode
  is being proposed for production.

### Known limits

No mismatch or ownership violation remains known in the enabled tested domains.
Focused TSAN covers the actual ownership header, not the whole emulator. Ordering
litmus tests execute extracted backend ISA contracts, not a new guest x86 test
binary. Actual helper tests cover CR0.NE exceptions; legacy FERR IRQ signaling
was not separately exercised. Two titles and short repeated captures cannot
establish universal game compatibility. Sega roster variation, temperature
drift and counter-window differences are explicitly retained in the evidence.
There is no exhaustive proof that every possible fast subset has been found.

### Source, build provenance and Git state

Final APK SHA256:
`84ef10fe4be3c1f987b0036e536fe85d33ac6477d8f7974d26933018f0d352c9`.
Its packaged native `.text` matches the archived built ELF:
`b260d8339f1ab4ea942027f66cad2b604d81ea60f4316ea39b50bca524842a4b`.
The complete downstream patch series applies to the unchanged pin. Source
corrections live in patches, not solely in the generated build tree.

Starting and final branch is `pandora-tcg`; HEAD and `origin/pandora-tcg` remain
`191008108dc04a7de5a7f3d235b9c726e2f37bd3`. `origin/main` and the merge base remain
`1a2385a9817e7d862cefb17358deb2da1c0e6bf3`. Starting root status was clean;
final changes are uncommitted and unstaged. Upstream Xemu remains clean at
`478b4f496102379c7eaa7f3ec10e714a703c4300`. Patch series and 0034 are unchanged;
0034 SHA256 remains
`35ac940618f86e446c03cb809e3f05c40f32014d40217664c80527c534024497`.

Tracked changes: patches 0032, 0033, 0036, patches/xemu/README.md and
scripts/profile-android.py. Added: this report and the 12 files in scripts/tests:

- run-voice-ownership.py and test-voice-ownership.c
- run-x87-differential.py and test-x87-fast.c
- run-x87-status.py and test-x87-status.c
- run-arm64-order.py and test-arm64-order.c
- correction-device.py
- run-correction-controls.py
- run-correction-validation.py
- read-screen.swift

No commit, push, merge, history rewrite, branch switch or main change occurred.

Artifacts live locally under `build/production-correction`: exact APK/ELF pairs,
text-section provenance checks, test outputs, navigation screenshots, per-run
controls/APK hashes, CPU/frequency/thermal samples and native logs. They are
ignored build artifacts, not tracked source changes. Authoritative final run
labels begin `production-v8`; earlier versioned campaigns are development
measurements and are excluded from the final checkpoint delta.
