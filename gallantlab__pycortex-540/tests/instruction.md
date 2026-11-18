# Issue

**Title:** ENH better handling of temp directory for downloading subjects

## Description

Tests keep failing in another repo due to how temporary directories are handled. This is an attempt to fix it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a82e10cda675`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.