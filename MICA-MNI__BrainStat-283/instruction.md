# Issue

**Title:** [REF] Update genetics precomputation

## Description

Updates the pre-computed genetics matrices for MATLAB to the newer abagen algorithm. Also fixes the Glasser parcellation on fsaverage.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46a8481cb6ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.