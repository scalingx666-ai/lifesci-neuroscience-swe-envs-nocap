# Issue

**Title:** [FIX] Fixed a bug that caused conncomp to error

## Description

-  

MATLAB's conncomp errors for some users. Although I have not been able to reproduce this bug, it's been reported often enough to be worth resolving. This PR switches from MATLAB's conncomp to a custom connected graph detection algorithm.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34835e190d32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.