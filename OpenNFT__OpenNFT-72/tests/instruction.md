# Issue

**Title:** Spikes and colors fix

## Description

Fixes:

1. Positive and negative spikes flags are reset after being written in rtQA_matlab structure
2. Colors on projection and in plots are identical to ROIs and to each other

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26dabea7a10a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.