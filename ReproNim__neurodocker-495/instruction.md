# Issue

**Title:** enh: add release workflow

## Description

Added intuit/auto-based workflow for releasing. this will update the repo with changes and make a release, which in turn will trigger a pypi release workflow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a46b695959a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.