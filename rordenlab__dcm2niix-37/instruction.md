# Issue

**Title:** Yaml improvements

## Description

- Moving the cmake dependency check so that there are no yaml library warnings for the original dcm2niix that might confuse the user when compiling.
- Adding documentation for OSx compilation with yaml dependency using homebrew
- Addresses Issue #34

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1fecd5814ee4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.