# Issue

**Title:** RF: Split template and fsLR resampling and sinking into isolated workflows

## Description

This is necessary to allow fMRIPrep to pick and choose workflows based on user requests.

This also replaces the old morphometry CIFTI-2 files with ones resampled along the lines of HCP.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ce21211412f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.