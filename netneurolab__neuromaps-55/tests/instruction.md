# Issue

**Title:** [FIX] Fix unsupported path-like objects for mni152_to_mni152()

## Description

The function `mni152_to_mni152()` calls the nilearn function `resample_to_img()`, but this function calls `_utils.niimg.load_niimg()`, which currently does not support path-like objects (e.g. `pathlib.Path` objects). Calling this function using path-like objects currently results in a `TypeError`. I fixed this bug by calling `load_nifti()` on the img and target objects before calling `resample_to_img()` in the `mni152_to_mni152()` function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `940f42e872f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.