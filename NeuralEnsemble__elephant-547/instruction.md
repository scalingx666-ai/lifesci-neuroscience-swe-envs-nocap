# Issue

**Title:** Fix old references to elephant-data in the code

## Description

The move of elephant-data from gin/INM-6 to gin/NeuralEnsemble was not reflected in all functions of elephant.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8aab43c8e5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.