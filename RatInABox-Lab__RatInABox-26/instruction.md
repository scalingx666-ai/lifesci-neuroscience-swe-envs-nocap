# Issue

**Title:** Fix bug when sampling points in a non-rectangular environment

## Description

Hey, I figured there was a bug with how points are being sampled randomly in non-rectangular environments. First, points were sampled uniformly within the absolute distance between the extents. Therefore, if the extent in x-direction was -2, 4, only points between 0 and 6 were sampled. Secondly, it should be checked whether points are actually within the boundaries of the environment if the environment is not rectangular. However, the last if-statement checked whether it was rectangular. Both bugs should be fixed with this PR. Feel free to have a look, thanks :)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb3b0f08beb0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.