# Issue

**Title:** 3dTshift: -no_detrend demeaned the wrong array for the second voxel of each pair

## Description

.

One-word fix: pass `gar+ignore` (not `far+ignore`) to `THD_const_detrend` in the second voxel's branch, mirroring the first voxel's block. Previously, with `-no_detrend`, the second voxel of each pair was shifted with its full DC offset against zero-filled (or Fourier-wrapped) edges and only a ≈0 mean was restored afterward, producing even/odd-voxel striping near run edges. `-no_detrend` forces `TS_rlt=2`, so the restore path re-adds exactly `g0` and the linear-trend variables are never read in this mode. Compiles cleanly with `-Wall`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `318e57b0efdd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.