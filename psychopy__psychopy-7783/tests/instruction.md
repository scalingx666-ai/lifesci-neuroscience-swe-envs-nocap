# Issue

**Title:** NF: Allow mapping `ImageStim` texture data to NumPy array

## Description

This PR adds property `ImageStim.imageData` to which returns a 3D array containing image color data. The array can be updated using the `unmapImageData()` method which causes any changes to the array to appear on the GPU.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ede716972ed1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.