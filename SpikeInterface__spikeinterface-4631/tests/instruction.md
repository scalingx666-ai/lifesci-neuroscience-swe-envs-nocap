# Issue

**Title:** Prepare 0.104.7 bug-fix release

## Description

Includes #4560 to fix SpikeGLX reader after removine `load_sync_channel`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `517155744fbb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.