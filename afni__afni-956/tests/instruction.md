# Issue

**Title:** 3dBrickStat: fix -automask voxel-scan truncation and -absolute integer truncation

## Description

.

1. **`-automask`**: set `mmvox` to the full grid size (matching what the `-mask` path guarantees), since `Max_func` uses it as the voxel-scan bound. Previously it held the in-mask count, so the slow-mode statistics scanned only the first `mmvox` voxels of the volume and silently dropped the rest of the mask.

2. **`-absolute`**: `voxval = fabs(voxval)` instead of `abs(voxval)` — the integer `abs()` truncated the double toward zero (and overflows for |values| > 2³¹).

Compiles cleanly with `-Wall`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `515e7d91a58b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.