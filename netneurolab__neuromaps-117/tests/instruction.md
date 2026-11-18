# Issue

**Title:** [FIX] Fix FutureWarning for `nilearn.input_data`

## Description

This fixes the FutureWarning raised when importing `NiftiLabelsMasker`. Thanks to @LeonDLotter for pointing this out in Issue #116

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1447e29dc3e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.