# Issue

**Title:** Fix interpolation arg in percentile numpy class

## Description

This pull request updates the way percentiles are calculated in the `make_adaptive_mask` function to ensure compatibility with different versions of NumPy. The code now checks the NumPy version at runtime and uses the appropriate parameter for the `np.percentile` function.

Compatibility improvements:

* Updated `make_adaptive_mask` in `tedana/utils.py` to use the `method` parameter for `np.percentile` if NumPy version is 1.22.0 or higher, and fall back to the deprecated `interpolation` parameter for older versions. This ensures the code works across a wider range of NumPy versions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c4c99d8284f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.