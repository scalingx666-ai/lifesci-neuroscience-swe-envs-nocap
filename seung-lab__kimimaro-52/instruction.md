# Issue

**Title:** fix: python3.8 compiles cpp code

## Description

Looks like Python3.8 needed an updated cython installation
to generate correct code. It seems 0.29.20 works.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b870b76b8596`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.