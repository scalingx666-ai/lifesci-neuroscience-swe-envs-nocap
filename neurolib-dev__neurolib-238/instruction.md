# Issue

**Title:** Fix numpy new version errors

## Description

`np.float`, `np.object`, and similar don't exist anymore, so fix it

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1e05096f2cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.