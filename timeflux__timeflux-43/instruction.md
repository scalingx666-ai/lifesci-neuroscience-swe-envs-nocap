# Issue

**Title:** Fix overlapping window and add unit tests

## Description

**Reformulate   since ml was merged**

- Fix duplicated sample on node sliding window when step was set to None
- Add unit tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `724dc68b4f3f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.