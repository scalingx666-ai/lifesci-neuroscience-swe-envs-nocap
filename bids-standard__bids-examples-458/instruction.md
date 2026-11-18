# Issue

**Title:** CI: Simplify schema validator installation

## Description

Leave instructions for how to test on other branches of validator and/or specification.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `401f4cfc0709`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.