# Issue

**Title:** MAINT: Get rid of black

## Description

We don't use black any more. Explicitly disabling it is confusing, it gives the wrong impression.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `180a2514aaee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.