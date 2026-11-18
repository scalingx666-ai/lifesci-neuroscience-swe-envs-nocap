# Issue

**Title:** Fix incorrect bvec orientation for Canon DWI data

## Description

When converting Canon DWI DICOM data, dcm2niix incorrectly generates bvec files if both of the following DICOM tags are present:
- Image Comments (0020,4000): contains diffusion gradient vectors in image space
- DiffusionGradientOrientation (0018,9089): contains gradient vectors in scanner space

The bug occurs because dcm2niix reads the gradient vectors from the Image Comments tag (0020,4000) and applies the siemensPhilipsCorrectBvecs function, which rotates vectors from scanner space to image space. However, for Canon data from this tag, these vectors are already in scanner space and should not undergo this transformation, resulting in incorrect bvec values.

This fix enables the code to correctly handle Canon DWI data regardless of which DICOM tags are populated: (0020,4000), (0018,9089), or both.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2fc09df2a3ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.