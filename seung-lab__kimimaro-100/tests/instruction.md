# Issue

**Title:** perf: faster remove_loops

## Description

Use a faster set operator and replace np.unique with fastremap.unique.

This seems to net a 4x (iterations per second) or 5x (time per hit) speedup.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42aa85d9b691`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.