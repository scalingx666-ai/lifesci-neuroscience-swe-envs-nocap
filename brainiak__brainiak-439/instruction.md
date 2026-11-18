# Issue

**Title:** Pin NumPy in Jenkins customization

## Description

Overlooked when pinning NumPy in PR #430.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04719aaa651e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.