# Issue

**Title:** FIX: Use np.asarray instead of np.array(..., copy=False)

## Description

Numpy 2 is changing `np.array(..., copy=False)` to error if the array cannot be made without copying. The semantics we want are `np.asarray(...)`, which will not make copies if the input is already an `ndarray`.

cc @larsoner

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e4facc17fbeb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.