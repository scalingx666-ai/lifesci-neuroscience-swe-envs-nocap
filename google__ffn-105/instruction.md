# Issue

**Title:** Fix a weird bug where using FFN inference interactively in Colab caused a kernel crash (!) when subsequent inference calls are made.

## Description

Fix a weird bug where using FFN inference interactively in Colab caused a kernel crash (!) when subsequent inference calls are made.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2b3a67d5d88a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.