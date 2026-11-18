# Issue

**Title:** Update default inference batch size

## Description

This PR:
- Updates the default inference batch size to 64. This is only based on my own local experiments that this seems to have the best compromise of speed and RAM/VRAM usage. It seems to speed classification up by approx 40% (depending on the number of points per plane).
- Exposes the batch size parameter in the napari GUI so users can change this if needed.
- Prints timing of classification (as with detection) to help assess performance.

I've left the training batch size alone because training requires more memory, and the batch size actually affects training (unlike inference). 

Closes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ebbd46509c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.