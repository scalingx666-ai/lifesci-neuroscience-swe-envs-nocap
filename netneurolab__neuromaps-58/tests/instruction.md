# Issue

**Title:** [FIX] Fixed UnboundLocalError in load_data

## Description

I fixed the `UnboundLocalError` that was sometimes raised when calling `load_data()` with array-like data. This fixes, among other things, the issue discussed in PR #34: `stats.compare_images` now works with parcellated data. I modified the docstring of the function accordingly. 

This commit also modifies the docstrings of `load_nifti()` and `load_data()`: I added explanations on how this function handles different `data` types.

Thanks @fmilisav for doing a lot of digging on this!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4257c0b7c4a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.