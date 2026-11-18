# Issue

**Title:** Add DICOMSpectRecon, DICOMCBCTRecon, PETReviewCompare and PETDenoise to 5.12

## Description

This adds four extensions that are already in `main` to the 5.12 stable branch: DICOMSpectRecon, DICOMCBCTRecon, PETReviewCompare and PETDenoise.

The JSON files are the same as on `main`. PyTorch, which three of them build against, is already in 5.12.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71864d02d9df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.