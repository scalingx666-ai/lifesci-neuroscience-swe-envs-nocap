# Issue

**Title:** [REF] Refactor load_data for gifti images with more than one data array

## Description

This PR refactors the `load_data` function to allow it's use for gifti images with more than one data array (e.g. for timeseries/functional data). There were a few issues with the function, which are related to how the `agg_data` method for GiftiImage objects (from nibabel) handles the intents of data arrays: when the intents of a data array is set to `NIFTI_INTENT_TIMESERIES`, the `agg_data` method returns a 2D ndarray, but when the intents are something else (e.g. `NIFTI_INTENT_SHAPE`), then the data arrays are returned as a tuple of multiple 1D array. The `load_data` was not working as expected in either of these cases (i.e. it couldn't load nor stack data images into numpy arrays).

This PR should fix Issue #139

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `398ec9416d30`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.