# Issue

**Title:** Task 3: Ensemble-2X (time-budget safe) (~15.12 ± 0.12)

## Description

File: braincraft/env3_player_ensemble.py
Score: 15.12 ± 0.12 (10 runs; seed=12345)
Method (short): Ensemble-style proposal search over a sparse, ESN-compatible wall-follow controller (hit reflex + single side depth ray). Proposal evaluation is CPU-time budget guarded (uses time.process_time() deadline) to reliably stay within the 100s training limit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4638f18efa0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.