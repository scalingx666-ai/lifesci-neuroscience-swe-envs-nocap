# Issue

**Title:** [ENH] Update dockerfile and GH actions

## Description

- Updates dockerfile
- Also updates github actions so it *should* only run on the main repo?? (Because rebasing my fork to upstream/main triggered an unwanted failed action run.) Hopefully it won't break it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62ba01851fda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.