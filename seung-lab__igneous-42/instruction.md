# Issue

**Title:** refactor: Convert task_creation.py to Iterators and TaskQueue 0.13.0

## Description

This change makes the interface for creating tasks cleaner and takes advantage of the newest TaskQueue features to allow for up to 10x faster single core upload.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `620274505003`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.