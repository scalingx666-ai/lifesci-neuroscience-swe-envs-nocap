# Issue

**Title:** keep output nifti orientation as input

## Description

Hi Ray, I updated harmonizationNIFTI.py to keep the output image file orientation (LPS) to be the same as the input ones (LPS) by including header in nib.Nifti1Image(). Previsouly when header is not included in nib.Nifti1Image(), output file orientation is automatically set to RAS.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `50ff4b1ec735`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.