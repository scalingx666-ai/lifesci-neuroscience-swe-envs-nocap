# Issue

**Title:** MRG: Glm input tests mask

## Description

This one fixes the masking issues raised by Matthew (#237).

@GaelVaroquaux: I would like to change the default value for opening: the default value should be 0 rather than 2 because 2 can create strange effects in synthetic example, and that the optimal values may depend on data resolution (opening=2 is typically a good choice at 3mm).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af13a0bd9ec3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.