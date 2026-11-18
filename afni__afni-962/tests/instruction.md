# Issue

**Title:** 3dROIstats: force the Bessel factor into floating point in -sigma/-nzsigma

## Description

`voxels[i] / (voxels[i] - 1)` in `long` arithmetic is 1 for every N ≥ 2, so `-sigma`/`-nzsigma` reported the population SD instead of the intended sample SD (biased low by √((N−1)/N); −5.1% at N=10). Cast the divisor to `double` in both branches, making the output the (N−1)-denominator sample SD and consistent with `3dmaskave -sigma`. Compiles cleanly with `-Wall`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `318e57b0efdd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.