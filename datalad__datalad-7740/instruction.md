# Issue

**Title:** Move project metadata from setup.py to pyproject.toml

## Description

This enables proper support by modern tools such as uv, making it easier to work on and contribute to the code.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aea09a72fe1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.