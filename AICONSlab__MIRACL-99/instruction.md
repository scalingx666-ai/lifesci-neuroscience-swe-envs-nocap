# Issue

**Title:** Fix heatmap method.

## Description

Fix the heatmap method to work with files that are scattered in subject directories, instead of all appearing in a single directory. This is needed for the ace workflow since each subject will have the required files saved in their respective directories, instead of in a single common directory.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9bce2d7fd278`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.