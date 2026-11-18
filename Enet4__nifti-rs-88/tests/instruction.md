# Issue

**Title:** Clippy fix + add Clippy to GitHub Actions

## Description

The cool thing about having an action for Clippy here is that detected problems are presented inline with the code changes.

The greatest change was taking the recommendation not to make exact comparisons in floating point types.
This was being done in header correction for `pixdim[0]`, to check whether it is either 1 or -1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45bdf32e4c92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.