# Issue

**Title:** Updating antsAverageImages

## Description

Enabling `antsAverageImages` to get a vector of filenames. This allows averaging of images without loading them in memory. Useful when working on big data with hundreds of subjects. Function is backward compatible.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f00b2033dfe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.