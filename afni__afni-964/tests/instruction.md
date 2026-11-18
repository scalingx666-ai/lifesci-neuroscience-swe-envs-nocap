# Issue

**Title:** 3dmaskave/mri_percents: fix one-past-end reads at extreme percentiles

## Description

.

1. **3dmaskave `-perc`**: clamp the rounded index to `mc-1` in all three datum branches.
2. **mri_percents.c**: at all 8 interpolation sites (float and short variants of `mri_percents`, `mri_quantile`, `mri_twoquantiles`), when the integer rank reaches the last element, return `ar[nvox-1]` directly instead of blending with a nonexistent upper neighbor. Interior percentiles are computed exactly as before.

Compiles cleanly with `-Wall`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `515e7d91a58b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.