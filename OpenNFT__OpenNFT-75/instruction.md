# Issue

**Title:** Displacements bug fixes

## Description

A few fixes for displacements:

1. Radian to degrees conversion for framewise displacement
2. Micro displacement calculation bug fix

One more change:

1. Update for ROI visualization on 3D images (up to 10 ROIs in one run)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e022324e535`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.