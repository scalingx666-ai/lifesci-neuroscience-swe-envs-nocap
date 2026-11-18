# Issue

**Title:** [FIX] Fix error and refactor zrand function

## Description

This commit fixes an error in the zrand function (as pointed out in Issue #152).

Rather than only fixing the error, I refactored the whole function. The notation and computations are now closer to what we find in Traud et al. (2011, SIAM Review). This makes the function much faster for large community assignment vectors (n>100). I however removed the numba decorator, so the function might be slightly slower for numba users when n<100. 

I also removed the `_dummyvar` helper function since it was only used in the `zrand` function

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5f462f7b80c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.