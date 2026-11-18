# Issue

**Title:** searchlight: Add minimum masked voxels proportion

## Description

A searchlight region is skipped if it does not have more than this
minimum proportion of voxels in the mask.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9844e657a565`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.