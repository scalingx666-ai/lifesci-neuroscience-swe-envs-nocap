# Issue

**Title:** Refactor check stability after bug-fix

## Description

While fixing #421 in #431, I tried to simplify check_stability. This is the result.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a536eee8adfe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.