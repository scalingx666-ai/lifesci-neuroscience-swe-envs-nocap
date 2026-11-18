# Issue

**Title:** WID-211: run notebooks on windows in github action

## Description

Prevent the infinite loop problem when running notebooks in the github workflow by switching from `latest-ubuntu` to `latest-windows`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d67bf1bdefb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.