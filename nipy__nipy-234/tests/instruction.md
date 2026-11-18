# Issue

**Title:** MRG: Mixed effects

## Description

This PR adds a Python EM code for mixed-effects-based statistics computation (typically one- and two-sample tests, but also more general designs).
It does not contain the framework for voxel-level inference and permutation testing. These should arrive in a future PR.
Feedback welcome,
Best,

B

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca2a7e5fbb0d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.