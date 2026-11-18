# Issue

**Title:** implemented ROI volume display (crude)

## Description

A crude way to compute ROI volumes in mm^3 and display the volumes side by side with the ROI name. Can be optimized by computing the volumes only once after the model finished the inference. I just do not know where to store these values to make them accessible in the callback. For that matter the labels can be also formed right after inference, so the colormap does not gets read on each call to the callback.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c6f77ed3c5c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.