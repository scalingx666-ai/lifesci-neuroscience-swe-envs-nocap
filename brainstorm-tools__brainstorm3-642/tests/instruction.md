# Issue

**Title:** Code to read resection from BrainSuite SVReg added

## Description

The code reads resection.mask.nii.gz file if it exists, generates a resection surface from it. Both the resection mask and resection surfaces are imported in BrainStorm. Documentation update to follow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a78b3371b7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.