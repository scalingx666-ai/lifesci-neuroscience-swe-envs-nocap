# Issue

**Title:** Addresses doc issues and package issues

## Description

Updated docs to contain instructions on test data generation script. Updates BinaryFile to have write_tiff function.

fixes the issues:
- #943 
- #944
- #991 
- #1007

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9808ecaf8985`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.