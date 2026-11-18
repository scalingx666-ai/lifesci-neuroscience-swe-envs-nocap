# Issue

**Title:** MRG: remove deprecated use of np.object

## Description

Apparently "object" is identical in behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1a6f954b39f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.