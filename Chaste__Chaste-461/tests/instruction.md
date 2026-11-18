# Issue

**Title:** Add Ubuntu 25.04 Plucky to portability testing

## Description

Supports #421

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9db0ee45ee90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.