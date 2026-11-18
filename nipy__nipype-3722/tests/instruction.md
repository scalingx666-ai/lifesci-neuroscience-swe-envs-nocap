# Issue

**Title:** [ENH]bedpostx and probtrackx gpu and multithread support

## Description

This will enable the gpu version of probtrackx2 and add support to specify the number of thread used by bedpostx (by default it uses a thread per available core)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b622463d2ecf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.