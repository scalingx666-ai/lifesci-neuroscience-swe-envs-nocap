# Issue

**Title:** Optimize `data.processing` functions

## Description

This PR improves several data processing utilities in `osl_foundation.data.processing`:

1. `standardize()`
    - More concise, Pythonic, and aligned with NumPy best practices.
2. `moving_average()`
    - Replaces `np.convolve(..., mode="valid")` with a cumulative sum-based approach.
    - Fully vectorized across channels (removes the for loop).
    - Reduces time complexity roughly from `O(n_samples · n_channels · n_window)` to `O(n_samples · n_channels)`, which guarantees performance improvements, especially for large window sizes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ccc32b2d8084`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.