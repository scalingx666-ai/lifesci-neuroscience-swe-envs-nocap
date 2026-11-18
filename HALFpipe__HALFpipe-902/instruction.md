# Issue

**Title:** fixing bug and adding try-except on spec load

## Description

fixing a bug on group level models and adding a try-except on spec file load so that instead of crash an error modal is raised with the exception

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e181253c9d60`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.