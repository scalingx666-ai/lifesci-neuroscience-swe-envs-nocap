# Issue

**Title:** VT-123. Add newest Julich Parcellation (3.1) to Siibra Connectivity page

## Description

Tested with latest siibra version: [v1.0.1-alpha.8](https://github.com/FZJ-INM1-BDA/siibra-python/releases/tag/v1.0.1-alpha.8)

Added a new Parcellation in the parcellation list and updated defaults and help text accordingly.
Also updated the tests to use the newest Parcellation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a16da5f5837b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.