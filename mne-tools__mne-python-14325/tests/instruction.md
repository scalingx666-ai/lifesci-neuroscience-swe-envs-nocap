# Issue

**Title:** Remove pip from dev dependency group

## Description

I don't think anything needs pip anymore, so I've removed it from the (default) dev dependency group.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45249daa9c46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.