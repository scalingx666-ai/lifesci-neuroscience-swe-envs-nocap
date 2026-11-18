# Issue

**Title:** More strict conformed requirement

## Description

The current code requires that input data is not only conformed in shape, but coformed in datatype to uint8. Therefore, without this patch brainchop has issues with images that have the correct shape but wrong datatype.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65d9c537ca45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.