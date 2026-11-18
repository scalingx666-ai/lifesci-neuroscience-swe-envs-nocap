# Issue

**Title:** Fix: sets cmake build type to Release in case it is empty

## Description

sets build type to Release in case it is empty and generator is not multi-config #840

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `746f07bc9b5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.