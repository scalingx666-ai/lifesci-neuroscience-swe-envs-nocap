# Issue

**Title:** Prepare 0.104.6

## Description

Minor release with #4466 to make 0.104.* compatible with latest NEO release (0.14.5), which removed `load_sync_channel`:  https://neo.readthedocs.io/en/latest/releases/0.14.5.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27975cc6edfe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.