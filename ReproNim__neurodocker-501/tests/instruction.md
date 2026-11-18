# Issue

**Title:** [TESTS] check black style in github actions

## Description

Fail the pull request CI if files would be changed when using `black`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed952ecbf811`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.