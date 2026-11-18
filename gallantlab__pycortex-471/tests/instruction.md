# Issue

**Title:** MNT deal with some nibabel deprecation errors

## Description

Fixes the most urgent issues with deprecation errors in nibabel.

We still need to change the `nibabel.get_data` to `nibabel.get_fdata`. Those will fail in Nibabel 5.0.X

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8135f0e865a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.