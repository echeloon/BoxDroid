# Proposed GPU diagnostic producer gating

Status: review artifact only. Not applied, compiled or device measured. No generated source or root runtime overlay changed by this task.

Dependency: root supplies `bool boxdroid_diag_producers_enabled(void)` in the common diagnostics header and runtime. It must return detailed diagnostics OR the process-startup `debug.boxdroid.diag_producers=1` force control. This artifact does not implement that API or mutate shared headers.

## Scope

- `surface.c` diagnostic-only target predicate gates argument preparation, 64x64 download staging hash, up-to-4MiB upload hash and target binding debug events.
- GPU probe entry gates allocation, image-to-buffer diagnostic copy, extra submission/wait, mapping and hashes, including the direct draw.c caller.
- Separate 32a download diagnostic predicate gates bounded full staging hashes/counters and readback debug metadata.
- `boxdroid_record_guest_draw` entry gates diagnostic register/scaling/state reads and bounded shader/texture/input hashing.

## Correctness boundaries

All real surface readback/upload, original Vulkan barriers/submissions/fences, RAM copies, unswizzling, dirty notifications, draw_dirty/upload_pending/download_pending updates and CPU memory coherence callbacks remain on their original unconditional paths. Only the additional diagnostic GPU probe and diagnostic reads/hash/event preparation are gated. Existing target addresses are diagnostic selectors, not fast-path or game assumptions.

When detailed diagnostics or the startup force control is enabled, these functions execute their previous producer code. With both disabled, logging-only counters and probe history do not advance; these fields have no architectural consumer. Their initialization remains unchanged. The force control intentionally recreates producer overhead even if log consumers internally return with diagnostics=0; it permits same-build attribution.

No timing/BQL instrumentation, timing_video_mode_probe or guest-flip timestamp instrumentation is changed. Other small direct debug event producers remain unchanged to keep the group bounded and interpretable.

## Review / validation limits

`git apply --check` passed against the current generated source, without applying it. Source inspection confirmed target predicate callers contain diagnostic work only; architectural dirty updates are outside the gated blocks. This is a proposed patch, with no correctness suite or device performance claim. Root should compile after supplying the API and compare force-on/off on one APK before retention. A disabled probe removes extra debug queue waits, so use ordinary GPU coherence/render correctness validation; the real readback path retains its own completion/barrier requirements.
