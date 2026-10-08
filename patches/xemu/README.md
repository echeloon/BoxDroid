# Xemu downstream patch series

BoxDroid uses the official Xemu submodule pinned at
`478b4f496102379c7eaa7f3ec10e714a703c4300`. The ordered downstream delta is
listed in [`series`](series). These patches have not been submitted upstream.

Keep core changes as small, reviewable Git-format patches here. State upstream
status and explain why the change requires access to core-owned state.
Android presentation, scheduling discovery and profiling orchestration belong
in `native/android/core/` and `scripts/`. Do not copy or vendor Xemu source.

## Reconstruct and build

```sh
git submodule update --init upstream/xemu
ANDROID_NDK_HOME=/path/to/android-ndk-r30.0.16248370 scripts/build-android.sh
```

The build creates a detached worktree under `build/native/source/xemu`, applies
the complete series, and preserves working-tree changes in `upstream/xemu`,
including its unrelated firmware submodules. It verifies the final ordered
series with a temporary Git index; patches that supersede earlier hunks are
supported without resetting or cleaning source trees. Select a new official
pin and update the gitlink only through an explicit baseline update.

## Performance patches

| Patch | Core-owned work and ordering |
| --- | --- |
| 0020 | Limit invalidation to the completed downloaded image; keep transfer barriers and queue completion. |
| 0021 | Wake assigned voice workers individually; preserve multipass cohorts and the completed-mix barrier; join before destroying synchronization primitives. |
| 0022 | Honor the Android runtime's bounded audio pool setting; use identifiable thread names. |
| 0023 | Grow synchronous download storage from 2 MiB to the original 64 MiB ceiling, waiting for the queue before replacement. Upload/compute storage stays independent. |
| 0024 | With profiling enabled, compare audio pool sizes at an APU-owned quiescent frame boundary. |
| 0025 | Opt-in worker queue, wake, wait, mixing-lock and EP work-budget counters. |
| 0026 | Opt-in comparison with the existing upstream DSP JIT; use upstream state migration at an APU-owned frame boundary. Interpreter remains the normal-play default. |
| 0027 | Declare the standalone PTIMER correctness test's Pixman dependency; production timer behavior is unchanged. |
| 0028 | Invoke Android's measured placement policy once on the serial TCG thread before guest execution; retain scheduler placement on unsupported or restricted topologies. |
| 0029 | Opt-in APU owner participation in one independent voice cohort alongside existing workers; keep guest list/multipass grouping and the completed-mix barrier. Mode changes join at a quiescent boundary. Default retains the discovered bounded background pool. |

The Vulkan renderer owns download buffers and completion, and the APU owns
voice dispatch and DSP state. These paths cannot be changed safely from an
Android UI callback. Detailed measurements, experiment controls, lifecycle
rules and limitations are in the
[Snapdragon 865 performance report](../../docs/performance/snapdragon-865.md).

TCG placement discovers the allowed mask and a distinct maximum-capacity core.
Android's scheduler remains the default: prime-only placement helped Pandora
but increased Sega GT audio underruns. `debug.boxdroid.tcg_prime=1` permits an
explicit experiment on a supported topology; zero or an empty property keeps
the scheduler. This control is read when the TCG thread starts. It changes
neither guest instruction ordering nor worker priorities; all other threads
keep their original masks.

`debug.boxdroid.voice_apu=1` compares APU owner participation: a four-cohort pool
then uses three background threads and the owner. Zero or an empty property
retains the configured background pool. This can be selected at startup, or changed
live with profiling enabled. The repeated Sega GT comparison reduced wakeups
but did not reproduce its first audio/cadence gain, so it remains opt-in.
