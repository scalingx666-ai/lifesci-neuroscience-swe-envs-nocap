# Issue

**Title:** ENH: use mktemp instead of hardcoded path to tmp file in current directory

## Description

otherwise would break right away in parallel run or when ran in R/O directory

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9333c227633a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.