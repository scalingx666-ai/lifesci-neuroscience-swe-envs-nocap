# Issue

**Title:** FIX ensure correct datatype for mri_surf2surf

## Description

New versions of nibabel will raise an error if the data has not the correct dtype.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a9a5bc05ca5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.