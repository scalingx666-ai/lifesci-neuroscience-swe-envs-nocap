# Issue

**Title:** fix(worker): Prevent Redis timeouts for idle connections in pool

## Description

This enables TCP keepalive for idle Redis connections to avoid a connection failure when a new task is queued after idle. Retry was also disabled so this would raise an error instead of reattempting or reopening the connection, occasionally losing task submissions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `160b62a854f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.