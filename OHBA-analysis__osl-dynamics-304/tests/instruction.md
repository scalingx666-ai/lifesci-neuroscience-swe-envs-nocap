# Issue

**Title:** Fix: use np.nanmax to deal with potential nans in t-stats.

## Description

This solves the issue #302.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `115c6f36549b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.