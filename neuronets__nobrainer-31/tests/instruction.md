# Issue

**Title:** ENH: bugfixes

## Description

- fix number of max steps in `train_eval`
- use non-overlapping strides if strides is `None`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b0fe0f8a582`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.