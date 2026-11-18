# Issue

**Title:** Load 3-channel label images in TIFF

## Description

labels in tiff format with 3 channels will be loaded using cv2.imread separately. If load tiff using imageio.imread, only single channel image will be loaded in.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `363a92762635`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.