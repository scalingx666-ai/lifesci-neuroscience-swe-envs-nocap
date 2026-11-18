# Issue

**Title:** Make pragmas enabled only for Clang or GCC 4.6+

## Description

OMP Pragmas are now enabled only for Clang or GCC 4.6+. Older GCC skips the entire suppression block, which is fine without -Wpedantic.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `473bed8199e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.