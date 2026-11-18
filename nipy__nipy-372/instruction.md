# Issue

**Title:** BF: make histogram bins integer for numpy 1.10

## Description

Numpy 1.10 seems to need an integer input to np.histogram.

Probably fixes gh-369.

I would be happy of a quick review.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a3ac5c008c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.