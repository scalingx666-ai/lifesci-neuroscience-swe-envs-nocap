# Issue

**Title:** Development

## Description

Improvements on master branch

1. Get protocol name from CSA header if 0018,1030 is stripped.
2. Improved DICOM renaming: terminates with error if there is a naming conflict, handles Siemens fieldmap where same instance number is generated for each echo.
3. Fix file naming disambiguation where features of one series (e.g. non-parallel slices) would impact names of other series).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d74eabceeaa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.