# Issue

**Title:** fix: drop Python 3.8 from CI, add Python 3.14

## Description

## What

- Dropped Python 3.8 from CI test matrix
- Added Python 3.14 to CI test matrix
- Bumped minimum Python requirement from `>=3.8` to `>=3.9` in `pyproject.toml`

## Why

Python 3.8 builds fail because virtualenv (bundled with Poetry 2.x) dropped its pip-seeder for Python 3.8. Python 3.8 has been EOL since October 2024.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `222b04059b1e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.