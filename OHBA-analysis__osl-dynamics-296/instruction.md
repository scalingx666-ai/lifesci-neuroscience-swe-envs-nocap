# Issue

**Title:** Add alpha sampling for simplified State-DyNeMo

## Description

This pull request introduces the functionality to sample alpha in the simplified State-DyNeMo model. The alpha state probabilities are sampled by initiating a random input for a single time point, then generating subsequent data points by shifting and feeding them as a new input.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `410fdf042572`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.