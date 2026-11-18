# Issue

**Title:** Optimisation changes in predict_cell_types

## Description

- Print suppression in multi-processing to avoid command line cluttering
- Model calibration save on local machine to avoid re-computing 
- Check for outdated model

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cb2a88e1590c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.