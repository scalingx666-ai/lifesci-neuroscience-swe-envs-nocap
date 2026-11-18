# Issue

**Title:** Perf: Optimize Network.run loop via unswitching and int tracking

## Description

I noticed the main simulation loop in `Network.run` had some overhead from repeated checks that don't change during a run (like `single_clock` and `device`).

I refactored it to split the "fast path" (single clock) from the multi-clock logic.
Also, `timestep[0]` is a numpy scalar, which is surprisingly slow to access in a hot loop. I replaced it with a local integer counter just for the loop condition.

**Benchmarks (1M steps, pure Python):**
* Before: ~7.99s
* After: ~7.59s
* **Speedup: ~5%**

Verified that `stop()` and `NetworkOperation` still trigger correctly with the new logic.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4960df7643dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.