# Issue

**Title:** [MAIN] update build_wheels action

## Description

Update the build_wheels action to use cibuildwheel version 2.13.1.

With this change wheels will also build for Python 3.11.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8fdca601b57e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.