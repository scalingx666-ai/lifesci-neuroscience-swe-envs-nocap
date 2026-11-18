# Issue

**Title:** Create deep copy of input model to avoid overwriting input

## Description

This PR creates a deep copy of the input model used in out-of-sample harmonization. Creating a deep copy avoids the problem of overwriting the existing model during the process of out-of-sample harmonization.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `55c5f1692734`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.