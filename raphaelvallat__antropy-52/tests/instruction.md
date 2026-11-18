# Issue

**Title:** Preserve epochs when averaging permutation-entropy delays

## Description

Averaging permutation entropy over several delays currently reduces both the delay and epoch axes for 2D input, giving one scalar for the entire batch. Average along the delay axis to keep one value per epoch.

The review follow-up also rejects empty or multidimensional delay sequences, accepts tuples and scalar NumPy arrays, and documents a 2D multi-delay example. Convert input lists to an array once before dispatching delays; single-delay checks still validate each lag separately.

All 32 project tests and repository Ruff checks pass, and the affected doctest passes. A recorded ECG/audio workload preserves the independently checked 1,024 epoch features and every original result record after the follow-up. Both fixes also compose locally with the ordinal-comparison PR #53.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfbe68874402`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.