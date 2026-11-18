# Issue

**Title:** ENH: Update pre-commit config to reference maintained "mirrors-prettier" hook

## Description

Use the fork of the (now archived) https://github.com/pre-commit/mirrors-prettier with the only difference being that it only references release versions of prettier, not e.g. alpha/beta versions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `04506ba65d52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.