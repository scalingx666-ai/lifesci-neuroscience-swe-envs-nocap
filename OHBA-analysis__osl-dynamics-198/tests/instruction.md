# Issue

**Title:** Refact: Use analytic solution in HMM dual estimation.

## Description

Switched to using an analytical calculation for dual estimation rather than training the observation model using TensorFlow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6f78dff7802d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.