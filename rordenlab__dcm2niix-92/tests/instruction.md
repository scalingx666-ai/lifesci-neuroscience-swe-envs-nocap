# Issue

**Title:** Update CMakeLists and CI configurations.

## Description

Use SuperBuild to better support to build with external libraries.
CIs support automated deployment now.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7611a7fb20cf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.