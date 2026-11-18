# Issue

**Title:** Fixes https://opbeat.com/neurovault/neurovault/errors/183/

## Description

This was a problem when tasks in the redis queue were trying to access a file that was deleted in the meantime.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2472d8ce309a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.