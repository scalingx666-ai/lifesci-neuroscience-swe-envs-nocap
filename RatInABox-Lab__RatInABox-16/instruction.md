# Issue

**Title:** versioning to 1.0.1

## Description

Version number error in setup.cfg 1.0.11 (incorrect) --> 1.0.1 (correct)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1a0c15e318b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.