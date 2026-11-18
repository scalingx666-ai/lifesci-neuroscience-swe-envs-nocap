# Issue

**Title:** Fix error that random seed is not set when using SpikeGenerator(seed=0)

## Description

When using seed=0 for SpikeGenerator, random seed was not set.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aa16f2ea6dbe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.