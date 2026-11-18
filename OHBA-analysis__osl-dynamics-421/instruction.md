# Issue

**Title:** Tinda optimisation

## Description

- Change TINDA calculation such that we are taking the mean of the intervals instead of concatenating and taking the mean,
- Optimize `optimise_sequence()` when the number of states is low.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3c16105382eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.