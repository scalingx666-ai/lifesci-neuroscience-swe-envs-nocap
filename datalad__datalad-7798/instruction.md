# Issue

**Title:** Add typing_extensions to build system requirements (Python < 3.11)

## Description

Currently, building datalad fails with Python 3.10 since `typing_extensions` is not part of `build-system.requires` in `pyproject.toml`,

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e7f04d9217b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.