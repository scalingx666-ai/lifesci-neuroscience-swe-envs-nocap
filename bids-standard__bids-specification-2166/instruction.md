# Issue

**Title:** fix(schema): Quote task in events association

## Description

Addresses 

The problem was that in `task in entities`, `task` is an identifier instead of a string, so it always evaluated `false`. The other fix helps in cases where, e.g., there is `channels.tsv` but `run-X_events.tsv`, which means that events aren't found by inheritance for those files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `228707b802c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.