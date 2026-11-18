# Issue

**Title:** No swap numpy dims

## Description

I've been staring at this a while and I can't see a case where the "fortran contiguous" data would correctly read into an ITK image. It might have the right shape but it seems that the voxels would be wrong. 

In any case, as used, the code always copies the data into a C-contiguous array (the default).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d7bd92ba751`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.