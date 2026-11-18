# Issue

**Title:** MRG: add mode and cval arguments for resampling

## Description

We sometimes need to resample images with specific ndimage resampling modes,
such as changing the constant values outside the boundary or the boundary
interpolation modes.

Add and test these arguments to the nipy resampling functions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb5a903bae5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.