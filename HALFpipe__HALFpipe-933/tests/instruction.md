# Issue

**Title:** Fix fmap problem

## Description

When the epi field maps have some suffix, e.g., _run1 or something like that, halfpipe failed to find and associate correctly the to the bold files. This here is attempt to fix this.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d97c4602e39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.