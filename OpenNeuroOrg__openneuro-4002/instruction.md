# Issue

**Title:** fix(worker): Add public tag to enableremote updates

## Description

Fixes some cases where the public tag was not set on a public remote leading to private only exports.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11bdc7fe3e52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.