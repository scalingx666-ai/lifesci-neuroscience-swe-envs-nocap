# Issue

**Title:** Do not use MRO with NamedTuples, which is not supported prior to py 3.11.

## Description

Do not use MRO with NamedTuples, which is not supported prior to py 3.11.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c3d83873bdd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.