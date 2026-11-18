# Issue

**Title:** kernel_workflow: schedule GPUs on demand instead of pinning engineers

## Description

## Problem

Engineers are bound to a GPU by index (`GPU_LIST[i % n]`) before anyone knows how long their work will take. Task cost varies ~23x within a single round, so a pinned round ends with the slowest **GPU** rather than the slowest **task** — whichever GPU draws short work sits idle for the rest of the round. On a shared box it is also fragile: `GPU_LIST[0]` has no fallback when GPU 0 already has a tenant.

## Change

`gpu_lock.sh` accepts a pool (`"0,1,2,3"`) in addition to a single id, and takes whichever GPU is both unlocked and idle at acquire time, holding it exclusively for the command. Idleness is read from the kernel driver via sysfs, not from our own locks, so a foreign tenant is visible too. (`amd-smi` is deliberately not used — it returns empty output while another process holds the GPU, i.e. it fails exactly when it is needed.)

The pool is whatever the caller passes, so this scales from 1 to 8 GPUs with no code change.

## Measured result

76 runs across 15 kernels on MI350X. Every number is the director's independent re-measurement against the frozen baseline, arms paired per kernel:

`n` = the number of **kernels** in the comparison. Each kernel contributes one paired run per arm (same kernel, same baseline, same budget, only the GPU setting differs), so n=14 means 14 kernels x 2 arms = 28 runs behind each row. `better / worse` counts those 14 kernels individually.

| | verified geomean | n (kernels) | better / worse |
|---|---|---|---|
| 4 GPUs pinned → 2 GPUs scheduled | 2.115x → 2.138x | 14 | 7 / 7 |
| 4 GPUs pinned → 1 GPU scheduled | 2.115x → 2.125x | 14 | 7 / 7 |

**The same optimization quality on a quarter of the hardware.** The differences are inside run-to-run noise, and the win/loss split is even, which is the point: freeing 2-3 GPUs costs nothing measurable.

GPU busy time over the same runs, sampled at 1 Hz across every GPU each cell held:

| arm | busy | idle |
|---|---|---|
| 4 GPUs, pinned | 4.6% | 95.4% |
| 2 GPUs, scheduled | 10.0% | 90.0% |
| 1 GPU, scheduled | 16.8% | 83.2% |

Utilization is low in all arms because these runs are dominated by agent thinking and compile time, not kernel execution — which is exactly why holding 4 GPUs buys so little.

### Recommended setting

**The default 2-3 directions per round on 1-2 GPUs.** Additional GPUs buy wall-clock, not speedup.

## Also included

- **`directions_per_round`** (default `null` = unchanged) for callers who want a fixed fan-out. It sets `DIRECTIONS_REQUIRED` for the planner *and* hard-caps the dispatch. Both halves are needed: the cap alone only truncates a short plan, and the prompt alone gets ignored — across 31 real `plan_round` returns the planner never issued more than 3 directions.
- **Colliding directions are dispatched last, not first.** 24 of those 31 plans (77%) issued directions sharing an identical `focus_files` set. Unique `(specialty, focus_files)` pairs now go first so the integrator gets stackable patches ahead of colliding ones. They are **reordered, never dropped**: on a single-file kernel every direction carries `focus_files=[kernel.py]`, the key collapses to `specialty` alone, and dropping would silently shrink the round below what the planner asked for.

## Compatibility

- `gpu_lock.sh <single_id>` keeps its exact previous behavior and code path. Verified both modes acquire and export `HIP_VISIBLE_DEVICES` correctly.
- With `directions_per_round` unset, the planner sees no new field and the round cap stays `BUDGET_REMAINING`, as before.
- `gpu_mode: 'pin'` restores index pinning, so the scheduler can be A/B'd as a single variable rather than across two scripts.
- `node --check` and `bash -n` clean.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6fa40c36b68b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.