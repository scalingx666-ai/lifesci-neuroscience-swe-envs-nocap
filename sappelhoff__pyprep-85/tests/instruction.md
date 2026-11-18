# Issue

**Title:** CI: enforce black style

## Description

cc @a-hurst this PR's CI should fail now (only the first commit is expected to fail)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47976ebbcf8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.