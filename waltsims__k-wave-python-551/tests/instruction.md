# Issue

**Title:** Rename fourier_shift

## Description

This pull request introduces several changes to the `kwave` library, primarily focusing on renaming and improving the functionality of the Fourier shift interpolation method. It also includes updates to the corresponding tests to reflect these changes. The most important changes include renaming the `fourier_shift` function to `phase_shift_interpolate`, improving the function's documentation and implementation, and updating the test files accordingly.

### Function Renaming and Improvement:

* Renamed the `fourier_shift` function to `phase_shift_interpolate` and updated its implementation to improve precision and clarity. The new implementation includes better handling of dimensions and phase shifts in the Fourier domain.
* Added a deprecation warning to the old `fourier_shift` function, advising users to use `phase_shift_interpolate` instead.

### Test Updates:

* Removed the old test file `fourierShift_test.py` which tested the `fourier_shift` function.
* Added a new test file `phase_shift_interpolate_test.py` to test the `phase_shift_interpolate` function and ensure it works as expected. This file also includes a test to check the deprecation warning for the old `fourier_shift` function.

### Import and Utility Updates:

* Updated imports in `kwave/utils/math.py` to include necessary modules for the new implementation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6ea904f350c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.