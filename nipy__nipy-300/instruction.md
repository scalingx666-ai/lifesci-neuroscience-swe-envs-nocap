# Issue

**Title:** MRG: depend on sympy 0.7.0; fix for sympy trunk

## Description

Remove sympy 0.6.x compabibility fixes.

Fix for changes in default sympy sorting in current trunk.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8d2d0f509fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.