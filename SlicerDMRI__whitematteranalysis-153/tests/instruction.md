# Issue

**Title:** ENH: Add all released Python version above 3.8 until 3.11 to CI

## Description

- ENH: Relax `numpy` install requirement version
- ENH: Add all released Python version above 3.8 until 3.11 to CI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27662020a62f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.