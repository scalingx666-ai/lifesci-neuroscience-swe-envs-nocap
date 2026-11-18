# Issue

**Title:** fix: high anisotropy causes defects

## Description

The hack for dealing with infinities set the threshold way too low. We can set it to near the top of the floating point range.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c95d4d7c4d5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.