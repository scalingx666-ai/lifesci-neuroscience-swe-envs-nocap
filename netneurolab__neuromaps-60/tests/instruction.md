# Issue

**Title:** [FIX] Fix bug in resample_images

## Description

This PR fixes : a bug in `resample_images` that would happen when a single str or os.PathLike object specifies the path to single-hemispheric `src` or `trg` images. This bug would happen when `resample_images`would try to load the gifti file of the un-transformed map. A call to the `tranforms._check_hemi` function fixes the issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8aaa841c3f37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.