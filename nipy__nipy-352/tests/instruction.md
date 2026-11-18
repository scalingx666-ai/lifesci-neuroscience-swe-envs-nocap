# Issue

**Title:** CONFIG: add config option for LAPACK compile

## Description

Add environment variable and setup.cfg option for compiling against external
lapack.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `048b6fb74033`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.