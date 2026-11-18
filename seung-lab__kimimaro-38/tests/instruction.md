# Issue

**Title:** perf: implemented flood fill based binary_fill_holes

## Description

On a soma, it appears to take ~6.5sec vs 20 sec for scipy

The nice thing about this algorithm is that it is constrained by the number of voxels in the cube, not by the vagaries of dilating shapes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `523d12b924b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.