# Issue

**Title:** Prefer with statement

## Description

Manually opening/closing the file is not exception safe. Use the with
statement and pass the handle around for the few functions which need
it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5a641c26bef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.