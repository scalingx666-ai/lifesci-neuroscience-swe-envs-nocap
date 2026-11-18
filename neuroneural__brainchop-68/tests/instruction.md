# Issue

**Title:** padding bug fix and refactor

## Description

This commit fixes a bug that lead to padding parameter grow the resulting input volume beyond the `[256,256,256]` shape.
It also refactors the code so that instead of 2 different inference functions we use just one now and instead of defining that function in multiple places `inference-logic.js` contains that function that we import.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b49f4d6d60f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.