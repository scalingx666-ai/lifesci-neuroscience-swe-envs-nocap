# Issue

**Title:** RF: rely on setuptools, drop setup.py heroics

## Description

Give in and always use setuptools.

Drop support routines for avoiding setuptools.

Always specify numpy and scipy dependency.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0832c7f2e019`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.