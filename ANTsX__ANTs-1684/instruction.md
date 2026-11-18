# Issue

**Title:** Refactor AverageAffineTransformFunction

## Description

Remove `NoRigid` variant, and add `useRigid` and `verbose` iVars to `AverageAffineTransformFunction`.

Removal of `NoRigid` variant is a code simplification.

Addition of verbosity flag allows use from libraries where debug output is not expected and undesirable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc0e56d8c9ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.