# Issue

**Title:** Tidy up

## Description

I'm not sure that putting `options(nat.default.neuronlist = 'dps')` in `.onLoad` is a good idea.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `778fd818e6af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.