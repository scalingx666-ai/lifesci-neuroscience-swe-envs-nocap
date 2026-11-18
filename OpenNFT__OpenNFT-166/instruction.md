# Issue

**Title:** Requirements and setup updates

## Description

1. Update requirements according to newer versions of packages
2. Set Python versions restriction to >=3.10 <4.0
3. Distutils to setuptools migration
4. Few fixes for numeric values

Should also fix installation problems in #161

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42f66eb7d368`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.