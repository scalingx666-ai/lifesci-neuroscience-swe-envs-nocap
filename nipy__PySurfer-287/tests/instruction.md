# Issue

**Title:** MRG, FIX: Fix bug with scale_data_colormap

## Description

On `master` the  gives:

![add_data_bug](https://user-images.githubusercontent.com/2365790/74865591-59912f00-531f-11ea-9049-0dd05c43af09.png)

And on this PR:

![add_data_bug](https://user-images.githubusercontent.com/2365790/74865484-2b135400-531f-11ea-8c09-9525d915d512.png)

@mwaskom feel free to look/test/merge if you're happy.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dd9f3b5d2225`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.