# Issue

**Title:** MRG: refactor scripts into entry points

## Description

Now we depend on setuptools, use entry points for scripts.

Thanks @effigies for the suggestion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `278d1e673d8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.