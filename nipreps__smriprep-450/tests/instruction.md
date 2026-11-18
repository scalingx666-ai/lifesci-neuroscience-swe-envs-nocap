# Issue

**Title:** FIX: Select function in segmentation resampling workflow

## Description

The segmentation selection code was a bit convoluted, this addresses the following:

- Adding a mapping for common replacements
- Avoiding string iteration
- Stopping iteration over files upon the first match
- Raising FileNotFoundError, rather than an unclear IndexError, if no matches are found.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f368a28b3288`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.