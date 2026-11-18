# Issue

**Title:** protocols, model helper, and roi-swglm

## Description

- This PR updates protocols and their handling to resolve bugs related to SVM and DCM after removing Baseline definitions.
- It also resolves some ambiguity on model helpers (i.e. either PTB_HELPER or MATLAB_MODEL_HELPER is required for DCM)
- It introduces a new plugin implementing step-wise GLM for ROIs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6095f924cd28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.