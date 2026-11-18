# Issue

**Title:** Changed get_data method (deprecated) to get_fdata(). Also changed the way you iterate through files, and saving now works (using matplotlib)

## Description

As discussed with OliJimbo on issue #6, I've changed the get_data() method for nib.NiftiImage objects to the new get_fdata(), which returns the np.ndarray.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20daae54b6f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.