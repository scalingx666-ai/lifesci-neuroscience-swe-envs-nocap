# Issue

**Title:** Hotfix: spaced encryption backfill recounts

## Description

Silent hotfix.
- The encryption backfill's recount runs at most every 10 minutes per vault, with its own 2-minute time limit, instead of timing out and rerunning a full scan every 30 seconds on a large vault.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f71714804a6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.