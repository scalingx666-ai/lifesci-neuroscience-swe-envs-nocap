# Issue

**Title:** BF: Handle errors when creating DisplayLink on MacOS

## Description

Handles errors when creating a DisplayLink object which crops up on some machines. If there is an error, a message will be logged and display sync will be disabled

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7725081c196`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.