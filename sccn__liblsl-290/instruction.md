# Issue

**Title:** fix: allocate output values only after success

## Description

A timeout path allocates output memory when the function returns no sample.

This change preserves caller output when a string pull times out.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e651023ca679`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.