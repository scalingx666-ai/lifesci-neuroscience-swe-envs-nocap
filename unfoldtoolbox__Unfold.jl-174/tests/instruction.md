# Issue

**Title:** Fix LMM, Fix STDerror bug

## Description

- relax MixedModelCollection to support ZeroCorr
- fix stderror bug, we have to ensure same type as  coefficients, not as data

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9fc71efc0164`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.