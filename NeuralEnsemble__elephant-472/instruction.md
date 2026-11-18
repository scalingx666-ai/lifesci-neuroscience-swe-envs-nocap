# Issue

**Title:** disable mac installs for now in setup.py

## Description

This PR addresses Issue #469 . 
Thanks @heplesser for reporting this.

**Bug:**
 Pip-installing Elephant fails with a compiler error under macOS 12.3.

**Fix:**
Disable mac installs for now in `setup.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59111ca15165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.