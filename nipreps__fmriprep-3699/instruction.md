# Issue

**Title:** ENH: Upsample BOLD coregistration template

## Description

When constructing a bold template (`--bold-coreg-level session/subject`, run BOLD references are now upsampled before the shared template is built: to 1.2 mm isotropic, or to the finest acquired voxel size.

This is inspired by the iProc pipeline's practice of upsampling before merging runs, and should reduce interpolation error during template construction. Validation on the [MSC dataset](https://openneuro.org/datasets/ds000224) ongoing, will mark as ready for review afterwards.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3143cf40697b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.