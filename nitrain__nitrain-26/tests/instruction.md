# Issue

**Title:** When using cuda, this method copies the model to GPU before the epoch…

## Description

… loop. This is suitable for static computation graph.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5245e4a61cb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.