# Issue

**Title:** [BUG] - Fix return in check_dependency

## Description

There was a bug in `check_dependency` that wouldn't return the outputs of the returned function. Within specparam, this never really came up, since we use this for plot functions (with no returns). Therefore, this fix makes the function do what it is supposed to do - but should currently have no impact on anything already using `check_dependency` within the module.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14d6196e0b60`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.