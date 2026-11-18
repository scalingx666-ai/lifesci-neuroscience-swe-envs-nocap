# Issue

**Title:** Expression substitution

## Description

For consistency with the mechanism in `Equations` and `Statements`, `Expression` objects can now also substitute variable names by other names or values. I've probably missed some places where it should be possible to use them, but this PR should cover the basics (threshold condition, `Synapses.connect` and state variable indexing/setting).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8ce4e2c040e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.