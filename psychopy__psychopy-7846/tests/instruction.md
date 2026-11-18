# Issue

**Title:** fix: ioHub server shutdown handling and orphan process cleanup

## Description

PR ensures iohub subprocesses shutdown when the main app exits unexpectedly by adding a watchdog and various other checks.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `326fb266728b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.