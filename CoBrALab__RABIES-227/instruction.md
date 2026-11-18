# Issue

**Title:** The ROIs for FC matrices are now better handled. A copy of the csv wi…

## Description

…th ROI annotations is generated. The exact same ROI numbers are present across subject matrices, even if some ROIs have empty values. This allows to properly compare subjects. The matrix figure colorbar scale is also from -1 to 1,

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8a31cf970ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.