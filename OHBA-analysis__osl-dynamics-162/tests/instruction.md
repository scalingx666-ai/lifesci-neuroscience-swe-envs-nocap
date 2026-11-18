# Issue

**Title:** Feature/dual_estimation

## Description

- Dual estimation for HMM and DyNeMo, this involves fixing the posterior distribution of time courses and re-estimate subject specific estimates.
- Option to silent HMM training
- Subject fine tuning for HMM.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f07b5c2b4a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.