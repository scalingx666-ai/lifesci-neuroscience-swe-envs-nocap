# Issue

**Title:** MAINT: Remove Makefile

## Description

I don't think the `Makefile` is needed in practice anymore. Let's scrap it in favor of `CONTRIBUTING.md` and better-scoped scripts (e.g., for CircleCI)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2abffbe06ece`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.