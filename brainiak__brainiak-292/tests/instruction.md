# Issue

**Title:** Fixing numerical issue and adding utility function

## Description

Changed the transition probability to scale with the number of timepoints, which should not change the solution (all valid paths have the same number of transitions) but gives better numerical stability. Also, added a utility function for computing weighted variance, which will be useful for the notebooks I'll be releasing in the future for the Schema project.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2a9871674ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.