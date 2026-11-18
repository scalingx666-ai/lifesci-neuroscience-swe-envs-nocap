# Issue

**Title:** Avoid setuptools warning

## Description

Avoids the setuptools warning with the latest version and makes it more future-proof in the sense that msvc-related import failures will only affect Windows.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b7c13d19091`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.