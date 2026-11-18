# Issue

**Title:** Hotfix: concurrent encrypted searches share one pass

## Description

Searches of the same encrypted vault with the same readable set that arrive while one is running now share the next pass: each row is read and opened once and scored against every waiting query. Results are identical to running them one at a time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `69746a0799a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.