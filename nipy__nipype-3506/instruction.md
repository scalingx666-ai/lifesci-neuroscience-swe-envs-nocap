# Issue

**Title:** FIX: Use interpolation/method in numpy.percentile as available

## Description

Bug introduced in #3489. Numpy 1.22 introduced method and deprecated interpolation in a single shot. Typically, they deprecate a few versions after they introduce an alternative, so I missed this and now things that have pinned, e.g., numpy 1.21 are going to break on nipype.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd39c1f53cbc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.