# Issue

**Title:** Two Bug Fixes

## Description

1.) Fixed 3 errors that occur when using only rigid motion registration. These errors were not caught by pytest.

2.) Fixed the swap of two anatomical ops descriptions during mouse hover in gui

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d2c099cb7d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.