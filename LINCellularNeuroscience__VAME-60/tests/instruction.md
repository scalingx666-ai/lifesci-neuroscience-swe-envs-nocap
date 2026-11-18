# Issue

**Title:** Optimize scheduler to reduce LR only when loss plateaus

## Description

This is an objectively much better implementation of the learning rate scheduler than you have running right now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c2b57be6260`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.