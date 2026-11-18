# Issue

**Title:** ENH: Threshold mask in images_to_matrix

## Description

Prevents cryptic error if the mask is not binarized, because the threshold was being applied to the numpy matrix but not the mask itself.

Also add some more tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d876d800b3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.