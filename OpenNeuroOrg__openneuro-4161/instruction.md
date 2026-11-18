# Issue

**Title:** fix(worker): Add memory limit for git-annex fsck

## Description

This prevents git-annex fsck from restarting the pod on out of memory. Instead the task will fail and retry with the next incremental step. This should reduce the disruption to tasks caused by large fscks that will run out of memory repeatably.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53b0c3962a6a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.