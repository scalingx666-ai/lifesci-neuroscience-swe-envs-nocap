# Issue

**Title:** BF: fix bug in writing PCA time-courses

## Description

We were using the axis number of the PCA analysis (usually axis index 3, time)
as the number of components (by default, 10).  Fix.

I've tested this at the command line with matplotlib, but it's hard to test
automatically without doing some image comparison test, and that seems like a
lot of work.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c066f0f8e8a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.