# Issue

**Title:** Deprecations and not passing tests

## Description

Added v0.6 compat.
* fixed deprecations
* fixed test not passing

since https://nifti.nimh.nih.gov/nifti-1/data/avg152T1_LR_nifti.nii.gz is down i commented that out

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af8c3cdfd84c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.