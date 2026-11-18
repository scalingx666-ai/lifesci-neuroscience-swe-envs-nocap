# Issue

**Title:** Remove rich tracebacks

## Description

This PR removes the rich tracebacks. Personally I feel that any benefit from having fancy tracebacks is negated by the fact that they are non-standard.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc0016968646`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.