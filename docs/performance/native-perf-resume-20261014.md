# Native performance run resumed 2026-10-14

Branch native-perf-tcg-run-20261013; HEAD599c2cc unchanged. No commits/push/merge.
Immutable preservation checkpoint 0037/0038 verified before edits: 101 files
match isolated reconstruction, all36 originalpatches unchanged. RP5 connected
as20537a44; properties empty after reconnect, restored recorded controls.

## Measurement correction

Guest-flip instrumentation packaged as guest-flip-checkpoint-20261014.
First native-run-resume-flip-on-20261014:16.297625 guest flips/s,578 timestamp
events, zero IDgaps; audio missing5.3905%. Screenshot shows indoor Dili
checkpoint, whereas original scene is outdoor bridge. Exclude it and its
off comparison from bridge performance conclusions; instrumentation coverage
only. Existing launcher was accepting anyPISTOLHUD and using moving autosave.
Add optional explicit saved-game row to correction-device.py; select row2
(date2026-10-13 21:48), verify scene image before comparisons. Initial indexing
selected EMPTY; corrected to one-based saved row index, manual one up selected
row2. Navigation record native-run-resume-bridge-select-20261014.

## Experiment27: terminal shared-lookup tail branch (pending)

Measured prior dispatch hotspot: sharedlookup348bytes,6.8783%TCG sampledweight
(native-run-shared-hot); sampling weight is not exact cycle attribution.
For an actual adjacent terminal lookup_tb_ptr/goto_ptr IRpair, branch to
sharedroutine directly and branch onward to returned target. Preserve standard
call-allocation spills, all globalsync, key/debug/mode guards, Cmiss bridges
and SP restoration. Nonterminal calls keep oldreturn ABI. Additional4shared
variants have original publication-after-QHT-retention/full-cache-flush rules;
BC/J-supported BTI_JC entry; farbranches use an indirect jump.
Opt-in debug.boxdroid.lookup_tail=1; defaultoff. Source exported as0039 pending
checkpoint in normalseries. Pre-edit CPU/harness snapshots saved under
build/native-perf-run/experiment27-before. No correctness or performance
acceptance yet. Build/package lookup-tail-20261014 in progress.

Scene/navigation correction: initial attempt to terminate off-navigation used
macOS truncated ps comm field, so process remained alive and conflicted with
bridge-selector. Both PIDs15813/15914 terminated explicitly; app stopped.
Discard off/navigation evidence; no performance conclusions from these attempts.
Current launcher optional row2 is one-based (one down), with confirmation handler.
Experiment27 builds successfully; two existing missing-prototype warnings in
translate-all.c, no new compile errors. Added an assertion proving that tail
variant slots4–7 are actually populated when lookup_tail=1. Focused suite now
running with app stopped and no concurrent capture/navigation workload.

27focuseddevice suite passed fully. Terminal shared tail entries=1 assertion
passed; duplicate-TB publication rollback, 147456arithmetic/65536MULPS oracle,
792691normal/3615interrupt visibility samples with zero observedviolations,
codealias/SMC/fault/MMIO/forcedTLBresize checks pass. Artifacts
lookup-tail-20261014-coverage-tests; APKdc968803d85a97bc920df5b11e3daf6092d3d8a790aa43391a7716e76408ee65.
Installed sameAPK with lookup_tail0 for clean saved-row2 bridge baseline; no
concurrent navigation controllers or focuseddevice suite. Metadata now records
lookup_tail, and flip-event timestamp-derived rate complements PERF-window rate.

Latest tail-off-bridge capture INVALID: inspected final screenshot shows indoor
scene; PID17044 exited cleanly at01:52:38 before readiness image (newPID17614
boot captured), then PID17614 exited at01:53:43 during/near measuredcapture,
newPID20160. Android exit-info saysEXIT_SELF/status0, notnativecrash/OOM.
No additional host navigation controllers present. Do not use any performance
result from this capture. Asked user asynchronously whether device was being
operated; investigating independently and adding PID-stability rejection.

User confirmed operating the device during prior captures and will leave it
untouched. This explains clean activity exits/relaunches; do not infer a
candidate correctness regression from those interrupted runs. Restarted clean
comparison native-run-tail-off-bridge-clean-20261014 from explicitrow2; added
readiness PID/HUD verification and capture PID stability rejection.

27clean sameAPK bridge on/off11.338062/11.394990 flips/s; timestamp-derived
on/off11.343168/11.405604. On battery315–317 vs off305; no establishedgain.
TCG95.6175/95.7980%, missingaudio5.3267/5.1716%. Bothprocessstable and
bridgeimageverified. Offbracket started tochecktemperature/order before
rejection; no runtimebenefit claimed.

28candidate design: direct-index normal-RAM translation shadow mirroring only
existing fast/victim TLB entries (not a larger guest TLB). No fixed host
registers. Page-indexed addend avoids mask/hash dependency and page comparator.
Permissions, watches, MMIO, dirty/SMC and alignment special cases retain original
helpers. Shadow lifetime follows existing entry eviction, page/range/full
flushes, dirty protection and adaptive resize. Sparse invalidation over original
entries avoids clearing full16MiB buffers perflush. Prototype not yetimplemented.

27OFF/ON/OFF bracket11.394990/11.338062/11.450841; laterOFF322–325
warmerthanON315–317 yetfaster. No materialbenefit established;27runtime
removed/reverseexported. Rejectedpatch/source/harness/identities/results stored
downstream under native-perf-resume-20261014/experiment27 (notinseries).

28prototype implemented and exported0039-tcg-direct-index-ram-experiment.patch.
Opt-in flat_tlb1;3x16MiB arrays (32-bit contexts1/3/5), allocationfailure leaves
oldpath. Sentinel1 versus page-aligned addend folds eligibility into alignment
test; unaligned/vector/othercontexts keepoldbackend. No residentregisters.
Shadows track originalfast/victim lifetimes; eviction, page/range/fullflush,
adaptive resize anddirtyreset hooks clearentries. Publish underTLBlock toavoid
concurrentdirty-reset race; warmgenerichelpers republish afterconservativeclears.
Not compiled, measured or accepted yet; no sourceonlygeneratedwork.

28first compile failed: generic TARGET_PAGE_BITS is runtime rather thanconstant;
larger CPUTLBDescFast broke backend -512 paired-load static bound at22modes.
Fixed with runtime4KiB allocationguard/assert and Xbox-only NB_MMU_MODES8;
scripts/build-native.sh136–137 enforces i386-softmmu forXboxruntime, x86
MMU_NESTED_IDX=7 highest (cpu.h2653–2660), new compileboundassert in cpu.c.
Other builds keep22. XboxMachine max_cpus1 (hw/xbox/xbox.c486); no CPU
hotplug interface. Shadow allocations/lifetime fixed at CPUrealize; fallback
maskperCPU respects failedalloc andunsupportedcontexts. Fullbuild358objects
completed, flat-tlb-fixed-20261014 package/sourceidentity stored.
Added focused positiveactualhit/page/range/full/dirty/victimeviction assertions
to current harness, alongsideexisting forcedadaptive-resize/MMIO/watch/fault
tests. Suite running nowwithappstopped; no benchmarks overlap.

28devicefocused suite passed all, including317147observedflat-fast hits;
newpage/range/full/dirty/victimeviction lifetime checks, existingforcedresize
MOVSD/MMIO/read-watch/remap/fault/SMC/alias/interrupt/fullstate/oracle cases.
Source3e6c246d50803b5124b6366da7d3223b25ad8b774e8cde95070e6fcca22540fe.
Artifacts flat-tlb-fixed-20261014-tests; newAPKinstalled. Starting35sclean
bridge comparison flat_tlb1 vs0 on sameAPK, sharedlookup/absolutePC/SSE/F32on,
lookup_tail0, count0/dump0/diagnostics0. No performanceacceptance yet.

28 preliminary on/off/on rates11.403573/11.281189/11.507533, temperatures
320/330/332; audio missing5.6962/4.9677/5.4689%. SecondOFF bracket
in progress on same flat-tlb-fixed APK. No runtime acceptance yet.

29prototype now exported0040-tcg-recovery-ir-uses-experiment.patch; opt-in
recovery_uses1 (cold state commit)/2 (also cold caller-register save), default0.
Architectural globals are explicit IR recovery inputs rather than implicit
liveness extensions. Copy propagation skips these inputs; labels/branches and
future canonical-memory requirements remain unchanged. Recovery-only deaths
are delayed until after guarded scalar RAM access; precise cold stores before
helper arguments; output allocations exclude recovery registers. Indirect
globals/parallel/unsupported widths retain original paths. This differs from
old5/6 hidden-lifetime prototype. Build running; not validated or accepted.

28 completedON/OFF/ON/OFF11.403573/11.281189/11.507533/11.371336
flips/s; allstableprocess, correctbridgeimages. MeanON11.455553/OFF11.326263
(1.14%); variability and thermal progression make acceptance premature.
Flat_tlb0 for29 comparisons;28remains provisional disabled, notretained gain.

29focused suite fullPASS, positive executed recovery fast17631/cold10285.
REP108cases, precisionPF/GP, MMIOcommittedstate, watch/remap, SMC/aliases,
interruptobserver andarchitecture oracle included. Actualsource
51c28680de155b17fa1fe7346bf96bf32c052313e3df8dffe29ae5575396a8e0;
APK32ca573e502a53dfb2477ebdda22a638736f2843f1d39f5d66e86dbbedc20b89
installed for recovery_uses2/count0/flat_tlb0 bridge comparison. Still
not final correctness or performance acceptance.

29b structural refinement implemented as recovery_uses3, separate29a snapshot
and packagedAPK preserved. Explicit commit IR is inserted before original
canonical-state boundaries (observing helpers, branches/labels, exits and
unsupported memory). Its store satisfies canonical demand at the boundary
instead of forcing home stores at earlier definitions; recovery uses preserve
precise cold-state lifetimes. Ordinary label/call/exit state rules retained.
No gameplay measurement yet for3. Build successAPK
4cf54cbc42137bf077238fe151ce95f6b3a11dcbe63b1a7f1d871a4dbb445e54;
source2d9f31d6cd64910a4bb4b936acc9b98e4fc344b6db3005d8bc5a5d852110e2de.
Current29a/count0 capture completes before device29b tests.

29a gameplay35s clean bridge recovery_uses2/count0/flat_tlb0:11.422483
flips/s, audio missing4.8131%, battery335constant, processstable. No
established materialgain versus11.3–11.4 priorOFF range.29b full structural
commit3 focused device suite now running; no concurrent application workload.

29b focused3 suitePASS including executed recovery fast20505/cold10319.
Existing architecture/exception/MMIO/REP/interrupt/invalidation checks pass.
No gameplay acceptance yet.

28rejected: tiny noisy1.14%cadence difference does not establish material
gain sufficient to retain48MiB shadow and lifetime machinery. Rejection does
not demonstrate impossibility or a hardwarelimit. Removedall28runtime changes
and baseline MMUstructure/count restored;29rebased/exported independently,
orderedpatchverificationPASS. Exactrejectedpatch, build/test identities and
results,4capture summaries/metadata/deviceconfiguration, harness snapshots
preserved downstream under native-perf-resume-20261014/experiment28.
Flatproperty0ignoredafterremoval. Clean29b standalone build now running.

Standalone29b source427ce918ed48b100ae350f8b0fde952f3c240c2f636e11e3ccd82613891be75f,
APK009c1d931543f065508c8acfc107af54e33d158542be300c92281d639ca919a8.
Focusedclean3 suitePASS, fast20505/cold10319; originalMMUlayout restored.
OFF35s bridge11.308903flips/s, TCG95.7823%, audio missing5.2301%,
battery325constant, PIDstable/bridgeimageverified. OFF15s diagnostic PMU
retired77,993,837,588 instructions,38,972,078,423 cycles,190,778,832
branch misses; grouped userTCGthread counters. Simpleperf emitted known
child-workload app-UID warnings despite positive attach counts/status0; retain
this measurement limit. Clean ON3 bridge35s capture now inprogress.

29b cleanON3 11.111986 versusOFF11.308903 flips/s atbattery325 both;
audio missing4.9311% versus5.2301%; no runtimegain. PMU ON77,286,629,772
instructions,38,834,857,915 cycles,198,202,317branch misses over14.999818s;
separate matched diagnostic cadence in capture. No major instruction saving.

29c hypothesis: snapshot input registers require protection before the RAM
guard, but scalar AArch64 output registers are not touched until after it.
Output allocation can spill an old owner without overwriting its physical value;
allow output reuse to reduce snapshot-related pressure. Existing backend
prepare_host_addr only uses reserved TMP registers/address beforeguard; output
used by actual RAM load or helper return afterguard. Source snapshot29b and
oldbuild preserved.29c exported/built; focusedactualTCG suite now running.
Not accepted.

29b PMU normalized diagnostic: OFF460.723489M instructions/flip versus
ON459.115451M (-0.35%); cycles230.215008M/230.695572M (+0.21%).
No substantial executed-cost reduction.
29c focusedsuitePASS withfast20505/cold10319, includingallprecision/REP/
MMIO/fullstatechecks. Installedrecovery-reuseAPK, count0/uses3 cleanbridge
comparison inprogress; unaccepted.

29allvariantsrejected andremovedactiveCPUcode; less0.4% normalized retired
instructions/flip gain and no robustgameplaygain. Exactpatch, variants'
source/build/testidentities and focusedresults, rawclean/PMUcaptures, latest
harness preserved downstream experiment29. OrderedpatchverificationPASS;
no29generated-onlycode. Refreshed15s profile attributedF32store/conversion,
save_exception_flags anddouble53 classification as recurringCPUcosts.
Profile29c source unchangedinstalledAPK while generatedcheckout reverted;
resolve exclusivelyagainstarchived recovery-reuse ELF.

30prototypeexported0041-x87-normal-f32-rounding-experiment.patch. Existing
privateF32 exactnarrow path stillhandlesexactnormal/zero; new opt-inf32_round1
integerpath rounds normalfinitebinary80 to normalbinary32 in allfourx86
rounding modes and mergesonlynewprecisionflag. Carryoverflow,underflow,
noncanonicalencodings,NaNs/infinities,otherroundmodes fall backunchanged.
ControlreadatCPUstatusinitialization; no TCGABI/state-recoverychanges.
Added170688directoriginal-helperoracle cases coveringallnormalF32exponents,
bothsigns,3PCs/4roundmodes,ties/parity/carry andrandomexistingstatus/masks.
Buildinprogress; no acceptance.

30first harnesscompilefailed becauseFPUS_SE/B macros are localfpu_helper
constants; correctedharness mask toexisting0x80/0x8000 convention. Runtime
sourceunchanged. Focused suitePASS including170688normalrounding cases and
all existingactualTCG FPstatus/rounding/FPUABI/memoryfault/MMIO/SMC tests.
Installed APKadf933f01dec591b393f547d32261ed91e96f4766cf21ebe182e0a419051189b;
source85b3ea3632c3e1fc4f896c8a0a48e0267ee46a9ef17896f23fe5453510a359f4.
CleanONf32_round1 bridgecapture running, count0/recovery_uses0; unaccepted.

30a firstcleanON11.195766flips/s, audio missing5.0323%, battery335constant;
no gainclaimed. SameAPKOFFcapturestarted. 30b movesroundednumericbody to
noinline preserve_most tailcalledhelper so the existingexact fast path need
not inherit additionalregister/frame pressure. Old30a source/build preserved;
newbuild/tests required. No change to rounding algorithm/eligibility/status.

30a sameAPKON/OFF11.195766/11.133159 atbattery335both (~0.56%);
not a retainedgain. Disassemblyfoundboth30a/30b exactwrapper paths are
stackfree, so outlining doesNOT demonstrateremovalofa helperframe.30b
changesoperand scheduling/footprint andretains tailcalls; don't infergain.
Outlined30b focused suite fullPASS including170688caseoracle,146244newfast
hits. Clean30b ON bridgecapture started on sameoutlinedAPK tobecomparedOFF.

Generatedhelper disassembly also exposes compiler-generatedzeroing of
caller-clobbered X8/X16/X17 on everyreturn (-fzero-call-used-regs=used-gpr,
QEMUmeson743–755). This is a separate futuretestable CPU-overheadhypothesis,
notyetimplemented: the generated-code ABI treats these regs as clobbered.
No hardening policy changed yet; firstfinish30measurement.

30b cleanON11.639083flips/s, missingaudio5.5398%, battery330–327;
promisingbutno sameAPK OFFyet. Current15sPMUONdiagnosticrunning.
Disassembly30a exactreturns clearX2/X3/X4/X5/X8/X16/X17, outlined30b
clearsjustX8/X16/X17; bothstackfree. Outline reducedwholefunction's
compiler-induced registerclear set. Clang21 primarycompilerprobe confirmed
zero_call_used_regs("skip") eliminatesthese ABI-optionalclears. Separate
helper-return attributeexperiment remains unimplemented.

31prototype internalTCGhelper return-attribute exemption from compiler
zero_call_used_regs, scopedBOXDROID_XBOX_RUNTIME/AArch64/Clang. No inline
attribute changed; no helper memory/global/ABIclobber contract changed.
Normalhostfunctions retain originalhardening. Explicitpreserve_most and
privateF32slow/roundedhelpers matchreturnattribute. This narrowscompiler
register-clearing hardening; it is not a gueststate semantic optimization.
ActualCLANGprobe proves eliminatedMOVzeros; performance stillunaccepted.
Snapshotpre31 preserved,003? export0042; current30bOFFAPK remains untouched
while hostbuild runs.

30b sameAPKON/OFF11.639083/11.366437 (+2.40%); ONbattery330–327
versusOFF330constant, audio5.5398/5.4578%. ON15s PMU434.683126M
instructions/flip and221.424968M cycles/flip; OFFPMUrunning. This is
provisionalonly pendingminimum repeat/finalvalidation, no nativeclaim.
31buildsuccess, APK e196bbd2630ea88afbff5cb3a05b01ad82d47f1142a06ed519783b12107a2877;
source360e34c3fff73aeb4fdbba70cc03d8df6d025024c64ec155f6d73dee1b46b699.
Wrapperdisassembly confirmsX8/X16/X17clearsremoved whileRET/tailcall
structurekept. Focusedsuitecompilation now; nodevice overlapwithOFFPMU.

Usersteeredresume whileactive: continuingexistingrun, no restart.
30b matchedPMU ON/OFF434.683126M/458.926248M instructionsperflip
(-5.28%); cycles221.424968M/226.151103M (-2.09%). Diagnosticcadence
11.655944/11.437795. Combinedwithclean35s+2.4%cadence makes30b
provisionalperformingcandidate, broadfinalvalidation/sustain/attributionstill
pending.31focuseddevice suite running withappstopped; no otherdevicework.

### Resume: helper-return candidate device measurement

Experiment 31 passed the complete focused actual-TCG device suite. Build and test identities, source diffs, result logs and current test harnesses for experiments 30–31 are now exported under the continuation record. Candidate 31 is installed; clean Dili bridge measurement is running with f32_round=1 and diagnostic counters disabled. No commit, push or merge.

Experiment 31 rejected: clean ON/OFF/ON 11.791588 / 11.678005 / 11.678123 flips/s, with first ON cooler (25C versus 26.2/27.7C). PMU instruction reduction alone is not sufficient; no repeatable material cadence gain established. Focused correctness passed. Scoped compiler-hardening exemption removed completely. Source returned to experiment30b; original register-clearing policy restored. All results and rejected patch exported in experiment31/.

### Experiment 32: forward conditional branch regions

Prior mapped execution samples place 15.5% of mapped JIT weight on the per-TB icount/exit-request load; this is sampling attribution, not an exact cycle lower bound. Prototype continues the untaken path of up to four forward Jcc instructions within the existing page/instruction bounds. Taken paths use original precise lookup/dispatcher exits without consuming direct-link slots. No new CPU-state recovery protocol, memory lowering or ordering changes. Eligibility excludes icount, PC-relative TBs, traps/interrupt shadows and plugins. Default disabled via branch_fallthrough=0. Build branch-regions-20261014 succeeds; actual focused validation in progress.

32 initial focused differential reached the exception case and differed only in exception_next_eip (expected fault EIP versus old TB-entry EIP). QEMU raise_interrupt2 explicitly documents/uses this scratch field only for software INT; #PF uses restored env.eip. Architectural EIP, flags, error code and CR2 agree. The disabled-control run additionally exposed a test assumption that a nonformed block would reach the later fault: corrected the harness to continue instruction steps after its ordinary early branch exit. No runtime fix applied or architectural comparison relaxed; software-INT metadata remains compared. Validation rerunning with these test corrections.

32 complete focused suite PASS after restoring new-test shared RAM/counter state. Formed branches98;2048 full-state cases, software INT exact continuation, guest SMC within formed region, precise #PF, MMIO callback once with committed GP state and concurrent interrupt visibility. All existing focused tests reach final completion marker. No runtime fix needed. Source/APK/test identities and logs exported to experiment32/. APK c71cdffbca2ea08c9381d9a2ed7ea4c24b745fbda628674c14570f0e1a0e2cb5. SameAPK OFF clean bridge capture running; f32_round1, count0.

32 additional STI/shadow and TF debug-trap tests PASS along with the full suite (formed102). Original shadow boundaries are retained even when STI follows a fused forward branch; TF excludes formation and traps after one instruction. OFF clean cadence11.564395, missingaudio5.2043%, battery29–29.2C. Bridge image verified. ON comparison now running with the same APK/configuration.

32a filter audit: X86DecodedInsn.immediate is target_ulong, so the initial positive comparison admitted sign-extended backward displacements. Execution still follows original side-exit semantics; this broadens formation rather than changing branch meaning. Corrected eligibility to (target_long)immediate>0 for intended32b forward-only heuristic; exported0043 and building branch-regions-forward-20261014. Currently running32a capture remains identified by its original APK and must not be attributed to32b.

32a broad branch selection clean OFF/ON11.564395/10.511111 (-9.11%); audio missing5.2043% both. Reject broad selection. 32b signed forward-only filter full focused suite PASS including explicit backward-boundary, CF_PCREL and CF_USE_ICOUNT translation guards, TF/STI, traps, fault, MMIO, SMC and IRQ checks. APK e889f3169c6e7ed333611707f46f4a073ad2cdac2c38a1b0e01febc0b660a0da; source e0c1593c77f1799bc89c2267519f1cab8f21e0b33ff80419f8fb7570b987e557. Currently measuring32b ON, no performance acceptance.

32b clean ON10.941049 flips/s, battery30C, missingaudio5.3419%; below earlierOFF11.564395. PMU timestamp-normalized473.384332M instructions and235.908718M cycles/flip (not yet pairedOFF); no gain. Same32b APK OFF bracket running. 32c prototype uses one forward same-page side exit with direct link0, and link1 for static preferred terminal path (backward taken / forward fallthrough). Other terminal path remains exact existing lookup. It retains original two-link ownership/invalidation/return representation. Source exported0043; branch-regions-linked-20261014 built, focused harness linked, device run pending after32b bracket.

32b same-session ON10.941049 / OFF11.588569 flips/s (-5.59%), OFF warmer30.7C versusON30C. This establishes regression for forward-only generic-side-exit design. Retain only as rejected evidence;32c linked variant is pending. Paired OFF PMU now running, then32c focused actual device validation.

32b paired PMU ON/OFF473.384332M/436.297822M instructions (+8.5%) and235.908718M/222.487438M cycles (+6.0%) per timestamp-derived guest flip; regression confirmed. 32c entire focused suite PASS including virtual physical-code aliases with CALL PC plus a formed forward branch and SMC/page/full flushes. No runtime correction needed. 32c installed, clean ON bridge capture running. Build/test identities and current harness archived.

32c clean ON11.502153 flips/s, battery30.7C, missingaudio5.2748%; no gain established versus priorOFF11.588569 at30.7C. Matched32c PMU/on-off comparison pending before final decision. No runtime implementation accepted from32 yet.

Diagnostic maintenance: parse already-read /proc thread user/system ticks and record actual CLK_TCK (RP5=100), allowing EL0 retired-cycle captures to be distinguished from total user+kernel CPU runtime. No additional per-snapshot device reads. Existing mixed GPR/x87, scalar-memory and REP stepped-reference comparisons now assert complete architectural EFLAGS before matching lazy-CC representation; older checks only matched that representation. New checks building against32c while OFF performance capture continues; device execution will wait for capture completion.

32c sameAPK ON/OFF11.502153/11.788982 (disabled control2.49% faster), OFF warmer31.5C versus30.7C ON. Reject entire32 group: generic-side-exit and direct-side-exit variants all regressed. Removed0043 completely; generatedsource returns to30b. Tests/diagnostics and all rejected variants/results preserved downstream. OffPMU running on still-installed32c disabled APK for final attribution; source mutation does not change that identified build.

32c paired PMU ON/OFF442.317390M/434.781685M instructions (+1.73%),223.356291M/218.898160M cycles (+2.04%) per guest flip; fits gameplay regression. Newly strengthened EFLAGS stepped-reference assertions pass on the disabled preceding path together with full focused suite. Further forced inlining of x87 status functions ruled out by actual helper disassembly: status protocol already inlined, profiler names denote source inline locations, not extra function calls. No new runtime change made for that idea.

### Experiment33: exact arithmetic leaf/ABI group

Actual parent helper disassembly shows a48-byte standard-ABI helper frame, SoftFloat call, and per-operation save/merge status work. Prototype extends existing23 exact PC53/RN normal-domain leaf technique to add/mul/sub/reverse-sub/div/reverse-div. Requires all exceptions masked, both inexact flags already sticky, canonical53-bit operands within unbiased±450 exponents, cached exact-fast policy and default host rounding/trap settings; FZ/DN immaterial within certified normal/zero domain. Every rejected eligibility check tails to an outlined original save/arithmetic/merge implementation. Private six helper declarations now preserve-most, with matching conservative functions; compiler register-clearing hardening unchanged. No memory/global helper contracts changed. Defaultdisabledarith_leaf0. Build arithmetic-leaf-20261014 succeeds; hot wrapper disassembly starts with guards and no frame. Explicit ABI plus existing numerical/architectural suites running.

33 entire actual focused suite PASS, including explicit eligible/conservative ABI/full-state checks for all six helpers (positiveleafhits1 each before broader suite). Source/APK/test identities and current harness exported. Installed arithmetic-leaf APK e74d1f28f089dedd64d62d83944f882378776b29d637352855d3c55f67b0be58, source1862661c21e54a2be2921ea307f21510ae902fb8a18597f30cb609bb2ec288ba; clean ON bridge capture running. No performance acceptance yet.

33 first clean ON11.649652 flips/s, missingaudio5.6585%, battery28.5C. TCG95.418%, userCPU32.60s/system0.82s over35s capture, sampledcores5/7. No improvement over preceding candidate established. ONPMU then sameAPK OFF comparison pending.

33 sameAPK ON/OFF11.649652/11.022930 (+5.69%), but ON28.5C versusOFF33.2C requires a repeat at current thermal conditions. ON PMU418.709591M instructions/flip and219.945962M cycles/flip; it reduces executed work relative to preceding435M baseline but not yet proven faster than the parent implementation. ON repeat running. ABI-only overhead and incomplete normal-domain coverage remain possible; no final acceptance.

33 ON/OFF/ON11.649652 /11.022930 /11.734688; repeatON33.7C versusOFF33.2C confirms leaf beats its ABI-only control (repeat+6.46%). This does not establish advantage over parent30b because the new slow ABI may itself regress. RepeatONPMU then exact parentAPK comparison at current thermal state; no final group acceptance.

33 repeatONPMU417.935498M instructions/flip,215.336031M cycles/flip, diagnostic cadence11.989760. Retired-work reduction is repeatable versus firstON418.709591M. Installed exact parent30b APK for same-current-condition control; arith_leaf0 ignored by that build, f32_round1 retained. Parent clean bridge capture running.

33 current-condition clean parent30b11.678179 versusrepeatON11.734688 (+0.48%) atsame33.7C; not enough standalone cadence evidence. ParentPMU435.025332M instructions and220.597512M cycles/flip versusrepeatON417.935498M/215.336031M (-3.93% instructions/-2.39% cycles).33 stillexperimental, notfinalaccepted.

### Diagnostic34: guest page sizes

Source x86_cpu_tlb_fill explicitly installs one4KiB fast entry even for4MiB translated pages. Added default-off page_profile counts for successful load/store/code fills at4KiB/2MiB/4MiB, plus low/kernel large-read splits. Counts do not imply executed access proportions. No paging, invalidation, permission, memory or ordering change. Exported0045. DiagnosticAPK a99e8f42a1a77dac14f51111f7b090b3b80f72144b48aa4fcd2312a9579bc9ee, sourcef8b04f3574f7844c4a1e9bfd6f51e17ca1d13eba87da52792361172e5699a2f2. Separate15s verifiedbridge capture running withpage_profile1; keepout of performance comparisons. No large-page runtime optimization implemented.

34 first15.07s fill delta:987944 4KiB loads,7265 large4MiB loads (allhigh-half; low0),192856 4KiB stores,1801 4MiB stores,321558 4KiB code fills. PIDstable and bridge image verified. Audio logger yielded no comparable production counter window in15s; wrapper audio assertionfailed due missing evidence, not evidence of stoppedaudio. Treat capture asdiagnostic only. Largepage-read shortcut is not yet justified for the low-address workload. Significant4KiB refill rate motivates inspecting actual table size/occupancy before choosing a memory-cache implementation. Extended profiler reports currentmmu_idx, tlb_entries andused_entries; longer35s diagnostic running onb7c61d4633f3018474eaa572a8eeeeab75ffbe420116d36e5af012467531e2e5. No runtime TLB geometry/mapping change yet.

34 occupancy capture completed:35.258s,2,375,639 4KiB load fills,458,870 stores,760,519 code fills. Table2,048–4,096 entries, sampled occupancy6–1,106, mmu_idx5. Does not justify a blind capacity increase. Added existing full/partial/elided flush statistics to default-off diagnostic; built arithmetic-leaf-flush-profile-20261014. Separate current-build CPU attribution capture running; no TLB runtime change.

33 rejected and fully removed: retired instructions improved~4%, but clean cadence differs only0.48% from exact parent30b and no material real-progress gain established. Compiler hardening intact. Rejected patch and evidence remain experiment33/. 34 flush diagnostic measured496.3 dirty-MMU-mode flushes/s over34.29s. Next35 hypothesis: physically validated TB backstop cache avoids repeated QHT lookup after architectural virtual/TLB invalidation; no TLB invalidation removal.

35 full focused suite PASS after correcting fault-test interception: ordinary cpu_exec delivers #PF through guest IDT and therefore does not return EXCP0E_PAGE; both enabled and disabled cache controls failed that initial harness assumption identically. Revised test catches actual helper lookup fault before delivery using normal cflags, preserves exact EIP/CR2 checks, with no runtime change. Positive physical-cache hits, CR3 reload/remap, SMC, global cache lifetime, first/second code-page faults pass; full existing arithmetic/F32/GPR/flags/MMIO/SMC/IRQ/recovery suite reaches final marker. APK3c55b8cee97b4470f3e0f6c951e9e69a5091d2ee38ecb75045e95d4b7147093c; sourcee04172346f88d886018cc3a2bb109f15e8112ed9a1568f0732ba0a3a362bf950. Clean ON capture next, diagnostics/count/page_profile0.

35 first clean ON/OFF11.479590/11.677960, ON32.5C versusOFF27.5C; do not infer gain. Paired PMU ON/OFF436.150617M/437.567360M instructions,223.530721M/223.159039M cycles/flip; only0.32% work reduction and no cycle advantage. RepeatON running at current temperature before rejection decision. 36 separate structural experiment: constant-time whole virtual jump-cache invalidation via generation-tagged32-bit PC, preserving page/SMC/TLB invalidation and rejecting stale key before pointer dereference. Requires target_name i386/target_long_bits32; generic core intentionally forbids TARGET_LONG_BITS, initial compiler assertion replaced by this enforced runtime eligibility. No runtime correctness claim yet; building.

35 rejected and fully removed: repeatON11.224489 versusOFF11.677960; ON11.479590 first. Focused correctness positive62 physical hits, but no real guest-progress benefit. Evidence archived. 36 pure generation-tag variant (no35 cache) full focused suite PASS after harness warmup correction: generation-on-miss does not populate jump cache until subsequent QHT hit, matching existing two-pass test warmup. Runtime unchanged for that fix. New stale-generation/wrap assertions, existing positive generated/C cache hits, CR3 remap/reload, faults, SMC, MMIO, flags and IRQ checks all pass. APK76191fbae9a58c28d959e8c33dfa9452231444f016766dbd5d46c61ca6072872, source7ddb58f2d8b863ff9f03ee9dd30a741d7bb8304d6b9ce6da21555edc0541bcae. Clean ON device capture now running; jmp_epoch1, phys_lookup0, page/count0.

36 pure sameAPK cleanON/OFF11.836882/11.507997 (+2.86%) at31.5/31.7C. PMU436.781431M/437.586198M instructions (-0.18%),219.513950M/223.969140M cycles (-1.99%) per guest flip. Audio underrun6.1945%/5.4514%; ON35s capture had5.24s kernel CPU time, versus0.75s OFF; subsequentONPMU0.72s/15s. RepeatON capture running; no final acceptance. TCG stilldominant; no native claim.

36 repeatON11.847661 flips/s at32.5C versusOFF11.507997 at31.7C confirms preliminary2.95%cadence benefit; repeatedONaudio5.7137%, user32.75/system0.73s over35s. No persistent kernel-time spike demonstrated. Keep36 provisionally while continuingCPUengineering; final broad/sustained validation and audio requirements unfinished.35/33 standalone rejected patch files moved out of active patches directory into their experiment archives; active series originals36+0037+0038+0041+0045+0047. No commit/push/merge.

Updated mapped capture native-run-epochs-hot-20261014:14.294G TCG sampling weight,7.452G mappedJIT, no unmappedJIT,194858 recordedTBs. Per-TB exit-check load13.93% ofmapped samples; EAX/ECX stores3.52%/1.58%. Sampling/skid are attribution, not exactcyclelowerbounds.37 began persistent fixed writable guest GPR prototype, supportedi38632/AArch64 only:0default,1 EAX/ECX,2all8. Canonical internal location becomes callee-preserved host register; precise C/fault/exit boundaries exportto CPUenv, Cwriters reload, normalRAM stays direct. Entry/epilogue imports/exports; all interrupt/exitrequestchecks retained. Exported0048, building; NO correctness/performance acceptance. Cold-guard IR concept was only read/reasoned about, not implemented.

37 first focused pin_gp1 run failed first MMX memory load, before any performance comparison. Cause: common prologue/epilogue emitted before target translator allocated fixed GPR bindings, leaving imports/exports absent. Failure logs/source/identity archived in37/. Added optional target early register-configuration hook before prologue; target initializer consumes the same latched binding table. Also protected second member of aliased input pairs. Rebuilding; no acceptance. No37 APK installed.

37 early-layout fix passes initial MMX, generation/collision/SMC/CR3/code-fault, fullstate arithmetic and x87 comparisons, but live-GPR block across pure numeric helper failed: EAX/ECX returned to pre-block values. Diagnostic prints established stale CPU-state reload. QEMU NO_READ_GLOBALS implies NO_WRITE_GLOBALS; prototype reload conditional had tested only the latter bit. Fixed reload to exclude either flag, preserving QEMU contract. Both failing builds/tests archived37/; full focused rerun in progress.

37a full focused pin_gp1/2 PASS, installed APK63679a0762f1ed77417d8c58c3dffc3eacff0663b7b10a8d33ce1fdb2f56f9be. Clean all8/OFF bridge11.479601/11.899298, battery31.2/31.2–31.5C. PMUall8/OFF445.721134M/435.329743M instructions and225.199787M/218.199167M cycles per guest timestamp flip, regression. EAX/ECX-only37a capture running. Variant37a patch and exact source/build remain archived;37b host rebuild overlaps installed37a capture only, neverdevice tests.
37b addresses redundant export on pure flag helpers using existing QEMU NO_READ_GLOBALS contract (explicitly excludes reads through exceptions), removing unnecessary new NoGuestExit metadata/liveness rules. Allows single nonaliased, non-newreg fixed output to use its legal bound register directly instead of scratch+MOV. Architectural synchronization on unknown/C/memory/exit boundaries unchanged. New variant unvalidated; current APK remains37a.

37b full focused modes1/2 PASS; pair clean11.701040 (battery31.7C), PMU436.910724M instructions/221.547430M cycles per flip: no benefit established. All8 comparison currently running.37c source exported0048 and host building while installed37b capture runs: remove adjacent final fixed-register assignment by retargeting a single I32 producer whose EBB output has no later use; no intervening effect/instruction boundary; faults retain prior architectural destination. Counts translation coalesces for positive focused validation. Variants a/b patches and builds archived, no37runtime accepted.

37b all8 clean11.252904 guest flips/s at32.0C; no demonstrated benefit.37c all8 focused suite PASS including precise faults/MMIO/SMC/IRQ, full-state arithmetic/FP/SSE, 26192 actual producer assignments coalesced. Pair focused rerun active. Reconstruction of active ordered patches passes. APK56159f2af5b2ff99627a64c38de1bdaa775339cca86f113c558caae69e49a6b0, source5aa1adb638a0a9afd1128f6aa1432304dedc2edf1bcb2c7f045fdbc5eeccab23; not installed or measured yet.

37 rejected completely and source reversed to retained30b+36. SameC APKALL8/OFF/PAIR11.563601/11.892977/11.739411 flips/s; pair435.550291M instructions and220.470078M cycles per flip, no material benefit. Allfailures, variantsa/b/c, focused suites, exact source/build identities, captures, controls and harnesses archived37/. Active series originals36+0037+0038+0041+0045+0047 verifies; restored source hash7ddb58f2d8b863ff9f03ee9dd30a741d7bb8304d6b9ce6da21555edc0541bcae. Installed validated36 APK76191fbae9a58c28d959e8c33dfa9452231444f016766dbd5d46c61ca6072872, app stopped, pin_gp0 ignored after removal. No native/bottleneck-migration claim.

38 x87 pointer reuse exported0048, buildAPK a4d89dfc7bfe256b719e137237d241bdc130ae979cc44f0e8f5122ccf0a0a74a source49fbbc5b9937b817cc26b217fbab7f12d6a4c3da7f28e00ee131c6df4a982caf. Reuse only dominates same straightline IR with unchangedTOP; reject explicitTOPwrites, unknown Cglobalswriters, CFG boundaries, plugin/hardFPU and decoder rollback. ON full focused PASS,46 positive expression reuses and1536 new fullstate blocks across TOP/RM/PC and direct/helper TOP changes. Existing fault/MMIO/SMC/IRQ/cache/FP/memory suites PASS. OFF focused check running; no performance acceptance orinstallationyet.

38 first cleanON11.984710 guest flips/s, audio missing5.3677%, battery30.2C. No gain claimed before freshOFF comparison; OFF capture active. Readiness image has transient missing overlay glyphs; end and post-capture image normal. Preserve images and compare baseline; no CPU correctness conclusion from one transitional image. Focused pointer test now includes PC24 as well as53/64; updated host harness linking only, device rerun waits until captures finish. Existing1536 assertion description previously overbroad: first run covered53/64, broader existing numerical suites separately cover all modes.

38 rejected and fully reversed: ON/OFF/ON11.984710/11.813826/11.899395, battery30.2/30.7/30.5C, all max policy frequencies. PMU434.366511M/436.137634M instructions per flip (~0.4% reduction),215.326685M/217.880124M cycles; no material reproducible cadence gain distinguishable from scene/thermal/run variation. Full focused ON/OFF and expanded PC24/53/64 tests PASS; allresults/source/patches/controls archivedexperiment38/. No38 runtime accepted. Retainedcandidate remains30b+36, no newnative progress claim.

### Resume 2026-10-15 / diagnostic39

Confirmed retained source hash7ddb58f2..., original0037/0038 intact; experiment38 already reversed. Reconciled stale CURRENT/outcome38. Added default-off0049 guest byte sidecar to existingtcg_dump: onlyexistingRAMmapping, within first guest page while translation locked, never new guest MMU/MMIO fetch. Ordered patches match generated source. APKcf286dc76340e8fe7d11109f249ccfb48844e6291224ee5cfc1b95a6c75c33e3, sourcece95bda30591937ba65d0d6e6b5c1ba2c099343e54751d13b812415b7ed4ded3, runtimeunchanged. Device had lost all debug controls and selected CUSTOM QualcommAdreno805; preserved selection experiment39/driver-before-resume.json, restored controls and System Vulkan for comparability. Navigation running; no new gain claimed.

39 diagnostic completed: matching175952 guest byte records and176406 hostTB records; retained-source full focused suite PASS dump0. Preserved compressed dumps, exact capture, reports, parser and identities experiment39/. Hot x87 transformations, register exchanges and copies, no dominant wait loop established. ResetPCffffffce is a real far-jump TB containing the appended shared lookup stub; its7.53%TCG sampled weight belongs to the container and must not be interpreted as execution of the far jump. The shared lookup has pronounced dependent metadata-load stalls (sampling skid caveat).

40 exact inlineFXCH/FCHS/FABS, propertyx87_bits0default/1candidate: full128representation swap and high16sign operations; hardFPU/profile fallback retained, no numeric changes. Build3fd18d9ce4045eddfd394f93993a107264d8e331a7c04f4601b7903b87cdf926 source301f646f49a68ffcada45494a7ca4f31d72821e27c5bf3f546d07493d22fd832. FocusedON12288stack/registerfullstate,6#NM,64precisePF-after-prior-ops and existing CPU/memory/IRQ/SMC suite PASS. Initial extra#NM harness misplaced before initialdecl causedcompileerror, moved with no runtimechange. CleanONcapture running, notaccepted.

40 rejected and fully removed: sameAPK ON/OFF11.763124/11.758492 flips/s at identical33.2C. PMU436.257604/437.447573M instructions and219.637678/220.771613M cycles per timestamp flip (~0.27% retired reduction), no measurable progress improvement. Full focused ON/OFF including new exact swap/sign tests PASS. All captures, controls, source patch and failure/fix evidence experiment40/. Retained runtime remains30b+36.

41 generated lookup scheduling experiment built, focused validation running. Primary full PC+generation key checked before any TB dereference; matching nonnull primary's immutablecs_base fetched early so eligibility checks overlap metadata latency. Dynamiccflags/INVALID remainslate; secondary/fallback/IRQ/debug/modechecks allretained. Processlatchedlookup_pipeline0 default/1candidate. Build9e88ae7585b4c966e02b4480c85f6eb1c9df7e4e5a805f9630bcd57d1872e575, source5c7ad9d6f0adaf52a43a2079ba365f25ad3cb5ac263661d74a6657aa5d136790. Ordered active patches including0049+0051 match generated source. No41 game result/acceptanceyet.

41 rejected/removed: ON/OFF11.766946/11.989521, ON439.666358M/OFF437.115380M instructions and221.367040/216.358783M cycles perflip. Scheduling did not hide enough latency to improve whole-system progress.42 acquire-read QHT candidate ON/OFF11.678010/11.636571 at34C, instruction/cycles slightlyworseON437.435300M/221.629218M versusOFF435.941470M/220.931498M; differencewithinvariation, rejected/removed. ConcurrentON/OFF3.35M/3.32M read and all focusedCPUtestsPASS; evidence experiment42/.

43 guarded x87 TOP prototype built3fe203259f6aa13dbbb589d1118989c9c4140f98b46a424ddbf832f46cafb851, source7ee6ecbbe6a6cbfee5c4f8629f818ac29dc9b205e6f258223c6e8611c8766825. CPU propertyfp_top1 addsSPECcflag; entry guard validates compile-observedTOP, normalTCGconstantprop foldsaddresses; nonx87blocks removeguard. Generickeydistinct, noarithmeticapprox. EarlydraftliveJITcodegenerationhazard foundbyinspection beforebuild: fixed tolookup-existingGENorleavedispatcher withpreciseinitialstate+cflags_next_tb forsafecompilation. Atomic/no-goto-pointer,icount,PCrel,trap/shadow/plugin/hardFPU/nonflat/non32 contexts notspecialized. Targeted96TOP/PC/RM+MMIO+#PF checks with98actualfallbacksPASS. InitialbroadONaborted inRCUflatviewcleanup, sameharnessOFFPASS; newtestusedtemporaryMMIOregion/observerwhosefunctionreturnedbeforeallRCUreferencesretired. Correctedteststorage tostatic; unchangedruntime thenfullfocusedONPASS. ExpandednormalCPU-exec tests (TOPhelperchanges,control,memory,trig/initialization) beinglinked. No appinstallation/gameplay/acceptance for43yet.

## 2026-10-15 structural run, experiment45

User resumed with30minute stop/question checkpoints (interval start17:18:10UTC).44 metadata-only prototype suspended unvalidated; all source/build/patch preserved in experiment44.43A guard reused only as coherent infrastructure for45, not reaccepted standalone.45 changes x87 operand representation: by-value exact F80 helper ABI + physical FPU fields represented as ordinary dynamically allocated TCG globals, post-optimization whole-block alias audit/promotion, second optimizer pass. Unknown aliases/helper contracts reject promotion. Existing guest-access and exception canonical-state synchronization retained. Source/build/provenance/focused evidence in experiment45; active0055. First ON/OFF full focused PASS; expanded ON passes73728 binary/9216 unary value oracles,480 normal execution programs,96 precise FWAIT MF cases and all existing focused suites.196 actual promoted accesses. Actual Pandora capture pending; no performance gain or acceptance claimed.

45A standalone rejected: ON11.486763/OFF11.710825, instructions451.750M/437.069M andcycles226.710M/220.286M per timestampflip; colderON. 45B adds cold-only precise recovery/caller preservation only to actually promoted blocks; old29 used no FPU globals, so this is a dependent representation experiment. B built/sourceexported/reconstructionmatches; focusedON/OFFPASS with500promoted accesses,372fast/1cold recovery, precise faultingFSTP-after-arithmetic status/no-pop andcapturedhotregion96cases. B game performance not measured/accepted. Best retained36 APK restored andappstopped for requested30minpause. Fullstate/outcomes experiment45/outcome.json andCURRENT.md.

## 2026-10-15 second30minute interval — experiment45 closed

17:59:18UTC resume.45B focusedON/OFF passed but gameplay ON11.440214/OFF11.554975; PMU451.366M/438.710M instructions and225.473M/222.943M cycles pertimestampflip, rejected.45C removed common F32 conversion stack/nested pointer-helper roundtrip while retaining exact conservative fallback: focusedON/OFF passed, direct170688 normal rounding and special F32 operand/state oracles. Initial new direct-load test incorrectly used pushing FLDS_ST0 as reference; corrected to non-pushing FLDS_FT0, runtime unchanged; failure records preserved. C ON11.782243/OFF11.560118; instructions435.644M/437.571M, cycles220.980M/223.147M. Small single-pair result lies inside control variation; no repeatable material gain accepted.45D adds existing preserve-most ABI to all value helpers to preserve seven more host GPRs; all11 common/special X9-X15full64 ABI and full focusedON/OFF pass. D ON11.493348/OFF11.825614; ON444.312M instructions/224.818M cycles, regression rejected. Five-event OFF stall PMU group invalid(tiny20464cycles/26628instructions, zero stalls), preserved explicitlyinvalid and not normalized; three-event C OFF capture valid. No CPU-stall/hardware-limit inference.

Added host-only classify-tcg-samples.py for reproducible analysis of preserved39 CPU-clock JIT samples. Existing perTB exit-check load accounts7.77%totalTCG sampledweight, CPU-env memory17.56% includingTLB, stackmemory1.09%, othercomputation21.82%, branches7.86%. Sampling skid/address reuse and synthetic decode-object branchtarget limits documented; not exact retired counts or removable-cost bounds. Confirms known32 exit-check cost, not a new hotspot. Source/backend inspection identifies repeated softmmu mask/table/tag work as next structural hypothesis; no new implementation begun.

Entire0055 value-residency group removed from active series/generatedsource. All variants, exactprovenance, tests, captures/images, PMU and rejectionreasons in experiment45; inactiveCpatch moved to patches/xemu/drafts/0055-x87-tcg-value-residency-not-accepted-20261015.patch. Ordered reconstruction matches rollbacksourcece95bda... and unchanged runtimeoverlay9d9807.... Fresh retained-after-values-20261015 APKcf286dc... byte-identical to archived39build. Device restoredbestretained36 APK76191f..., appstopped, fp_values0/count0. No commit/stage/push/merge.30min userpause due18:29:18UTC; awaitanswer. No new retained speedup, no bottleneckmigration or native certification. Rollbackfocusedvalidation running while checkpoint is written; see CURRENT.md for finalstatus.

## 2026-10-16 resumed interval18:00:53UTC, experiment46

Prior interval interrupted before user30min checkpoint; completed AOFF/build preserved, no rerun. A ON/OFF10.730579/11.530537(-6.94%) rejected. B cached exactgenericTB link fixedbuild282a8297... full focusedON/OFFPASS inclpositive direct-link. B cleanON/OFF10.716112/11.677172(-8.23%),448.155/435.439M instructions and240.642/220.200M cycles perflip. Rejected. Resolved exactB20s nativeprofile shows recovery unwind tiny; metadatareplacement ruledoutasunsupported, notimplemented.

C adaptivewithdrawal build02f1d65... source407e33d5... control3; invalidates executing unsuitableblock withstandardQEMU machinery afterpreciserestore, hashedconservativeblacklistonlydisablesfurtheroptimization. NoJITgenerationinlivehelper. Full focusedON/OFFPASS: warmedselectedzero-retry path, positivewithdrawal/no-reselection, freshPCwarmedMMIOread/write/resize4, precisePF2, priorarchitectural/flags/SMC/IRQ/faultsuite. Orderedpatches reproducegeneratedsource, runtimeoverlayunchanged. SameAPKgameplayONcapture running; noCgainaccepted.30minpause due18:30:53UTC.

46 closed: C9.450686/OFF11.662344(-18.96%),504.458/436.145M instructions and272.224/221.747M cycles perflip. All A/B/C rejected and0056 entirely removed. Original rollbacksourcece95bda... reproduced fromorderedpatches, rootruntimeoverlayunchanged. Restored best36 APK76191f..., appstopped, tlb_ir0/count0. No new retainedgain or experiment47. User30minute pause; nativegoal incomplete, no Xboxreference, audio deficits persist. Full evidence+manifest in experiment46.

## 2026-10-16 structural run: experiments 47, 48, 49, 50

### Experiments 47 & 48 (Retained Provisional)
Gated diagnostic overhead: `0057-gate-diagnostic-vram-watch.patch` gates diagnostic VRAM CPU watchpoint scans; `0058-gate-diagnostic-producers-and-timers.patch` gates diagnostic GPU producer callbacks and MMIO/BQL/PGRAPH timing counters when `diagnostics=0`.
144 policy checks PASS; focused device suites PASS.
Same-APK 3-run ON/OFF/ON bracket on Dili bridge:
- ON #1: `12.413075` guest flips/s (`p50=79.21ms`)
- Legacy OFF: `11.331378` guest flips/s (`p50=87.55ms`)
- ON #2 Repeat: `12.529794` guest flips/s (`p50=77.79ms`)
Repeatable `+9.55%` to `+10.58%` same-APK gain. Best retained advanced to `12.41–12.53` flips/s (+33.95% vs clean baseline).

### Experiment 49 (Retained Provisional)
Scoped RAM callback TLB invalidation (`0059-scoped-tlb-callback-and-dirty-mmuidx.patch`): eliminates the second stop-the-world `tlb_flush_all_cpus_synced` barrier on memory access callbacks, preserves unrelated TLB entries and `tb_jmp_cache`, adds dirty-MMU filtering in `tlb_reset_dirty`/`tlb_set_dirty`, 2MiB/4MiB large-page presence tracking in `tlb_flush_page_locked`, and single-RCU dirty bitmap checks.
Focused device suites PASS for both `tlb_cb_scope=1` and `0`.
Same-APK 3-run ON/OFF/ON bracket on Dili bridge:
- ON #1 (`tlb_cb_scope=1`): `13.684275` guest flips/s (`489` flips, `p50=71.84ms`, `bql_reacquire=73.24us/s`)
- OFF (`tlb_cb_scope=0`): `12.841707` guest flips/s (`456` flips, `p50=76.41ms`, `bql_reacquire=256.70us/s`)
- ON #2 Repeat (`tlb_cb_scope=1`): `13.491004` guest flips/s (`481` flips, `p50=72.65ms`, `bql_reacquire=55.86us/s`)
Repeatable `+5.06%` to `+6.56%` same-APK speedup (and `71.5%–78.2%` reduction in BQL reacquire wait). Best retained advanced to `13.49–13.68` flips/s.

### Experiment 50 (Retained Provisional)
Host FPCR caching across x87 double53, float estimate, and SSE mulps paths (`0060-fpu-fast-paths-zero-bypass-and-cached-fpcr.patch`): eliminates per-op `mrs %0, fpcr` system register reads on hot execution paths, adds zero-operand fast bypass in `boxdroid_f80_double53` for `ADD`/`SUB`/`MUL`/`DIV`/`SQRT` avoiding SoftFloat fallback / `FloatParts128` unpacking, implements exact IEEE-754 zero-sign rules in identity paths, streamlines inexact-only exception flag merging, and preserves exact x87 unmasked trap synchronization.
Validation:
- `test-x87-fast`: 20,548,716 differential comparisons against reference SoftFloat passed with 0 mismatches.
- `test-x87-status`: 288 cases covering masked/unmasked `FPUS` + `FWAIT` + control cache OFF/ON refresh all passed.
- `tcg-state-recovery`: All 35+ full-system test suites passed on RP5 device.
- Complete ordered downstream patch series verified.
Same-APK 3-run ON/OFF/ON bracket on Dili bridge (APK `4de88684...`):
- ON #1 (`fast_fpu=1`): `14.197253` guest flips/s (`507` flips, `p50=69.16ms`, `p95=81.59ms`, `bql_reacquire=130.94us/s`, `26.7–27.0C`)
- OFF (`fast_fpu=0`): `11.353157` guest flips/s (`400` flips, `p50=86.28ms`, `p95=100.51ms`, `bql_reacquire=115.68us/s`, `28.2C`)
- ON #2 Repeat (`fast_fpu=1`): `14.136043` guest flips/s (`503` flips, `p50=69.65ms`, `p95=83.04ms`, `bql_reacquire=63.06us/s`, `29.0C`)
Repeatable `+24.51%` to `+25.05%` same-APK speedup (+2.78 to +2.84 guest flips/s), advancing best retained candidate to `14.136043–14.197253` guest flips/s (`+3.75%` to `+4.78%` vs Experiment 49 retained; `+51.12%` to `+51.78%` vs `9.354035` baseline). First project milestone breaking 14 FPS.

