# Issue

**Title:** Manual ROI issues fixed.

## Description

This PR addresses #419 and #391. 

- Updates `drawroi.py` to use refactored functions in `detection` and `extraction` subpackages.
- Can now extract traces from manually added ROIs
- Can save and quit from ROI drawing screen. Saved `stat.npy` will contain the added ROIs and related info.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `142ed8bdac70`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.