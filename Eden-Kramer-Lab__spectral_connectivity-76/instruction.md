# Issue

**Title:** Fix CuPy batched solve shape mismatch in _estimate_transfer_function

## Description

Fixes CuPy GPU crash in `_estimate_transfer_function` where a non-batched identity matrix `(M, M)` was passed to `xp.linalg.solve` with a batched `a` of shape `(..., 1, M, M)`. 

Fix: broadcast identity to match `H_0.shape` before solving.

Confirmed working on NVIDIA B200 GPU with LFP dataset.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5d29830ff57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.