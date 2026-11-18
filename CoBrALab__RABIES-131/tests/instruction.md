# Issue

**Title:** Completely rewrite dockerfile based on MAGeTdocker

## Description

Add submodules for the external scripts, rewrite the container to use newer/official releases and install sources.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20a6fe88751b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.