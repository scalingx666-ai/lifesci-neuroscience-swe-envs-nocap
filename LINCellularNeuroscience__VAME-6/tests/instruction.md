# Issue

**Title:** Fix interpolating nan values

## Description

Interpolation of body part positions starting with nan values is not possible (for all nan values up to the first non-nan value). These values stay as nan values. This leads to a "numpy.linalg.LinAlgError: SVD did not converge in Linear Least Squares" error when executing the savgol filter.

This pull request fixes this by replacing the first nan value with the first non-nan value in the series for each body part, if the series starts with a nan value.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2551965092a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.