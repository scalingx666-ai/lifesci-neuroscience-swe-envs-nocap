# Issue

**Title:** Allow for non quadratic images

## Description

We tried to use non-quadratic scans and encountered problems in vol3Dimg2D and getMosaicDim. The mosaic is constructed in a way that only uses the first image dimension. However, this can be changed straightforwardly by using the second axis of the scan in the mosaic.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34717e104a46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.