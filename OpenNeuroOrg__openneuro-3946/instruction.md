# Issue

**Title:** fix(server): Check that contributor names are not malformed lists

## Description

Add test coverage for the assembleMetadata function and fix an issue where an array is accidentally formatted as a string and could get passed as one name. Fixes a related bug where the order field wasn't stripped out.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a7551000d8f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.