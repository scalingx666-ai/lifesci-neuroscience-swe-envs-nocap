# Issue

**Title:** Fewer ci runs

## Description

A few modifications to our GitHub workflows, aiming to run them less often (e.g. not run the test suite when only the README file was changed).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ecb7602e203`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.