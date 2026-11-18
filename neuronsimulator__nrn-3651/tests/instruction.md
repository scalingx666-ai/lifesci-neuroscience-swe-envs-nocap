# Issue

**Title:** use `[:blank:]` character class for SWC parser

## Description

* seems to work more reliably on libc++; ie: the default C++ library for macOS
*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f0a6f7544ea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.