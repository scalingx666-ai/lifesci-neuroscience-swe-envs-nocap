# Issue

**Title:** TST: Allow for tests under NFS (cron run only) for x20 more time.

## Description

To mitigate at least some failures due to timeouts, as discovered/noted in

-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aea09a72fe1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.