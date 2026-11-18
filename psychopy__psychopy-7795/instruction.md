# Issue

**Title:** RF: Add MacOS 10.15+ camera enumeration method and rework stopping logic for recordings

## Description

Use a newer enumeration method for finding cameras on MacOS 10.15+. Solution is backwards compatible with older MacOS versions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3398b00b7677`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.