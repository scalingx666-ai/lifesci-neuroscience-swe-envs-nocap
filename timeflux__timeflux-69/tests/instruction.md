# Issue

**Title:** Fix/epoch

## Description

- Fix on `nodes/epoch` : check that buffer is not None before checking index are monotonic
- Change on `estimators/transformers/shape.py` : expand dimension only when shape is 2D. Use case : for data epoched without an overlap, the training X will be of 3D but the testing X will be of 2D. Hence, we want to reshape only if necessary.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1f17fd27e17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.