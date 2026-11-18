# Issue

**Title:** Warn epoch monotonic

## Description

If epoch index is not monotonic [L63](https://github.com/timeflux/timeflux/blob/bb0c390aad629e4ad9a84696d6ecb298fe6638a2/timeflux/nodes/epoch.py#L63) will raise an Exception. Warning the user and returning as a safeguard from interruption.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb0c390aad62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.