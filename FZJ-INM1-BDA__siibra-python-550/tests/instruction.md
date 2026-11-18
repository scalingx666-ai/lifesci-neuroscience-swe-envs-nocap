# Issue

**Title:** Use codecov v3

## Description

(Based on discussions in the link provided in the issue) could potentially solve #261. Should watch out for upload failures afterward.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8156f1c0f558`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.