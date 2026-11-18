# Issue

**Title:** Downgrade version to 2.7.0 in __init__.py

## Description

Reverts the package version from 3.0.1 to 2.7.0 in brainpy/__init__.py, possibly to match a previous release or resolve compatibility issues.

## Summary by Sourcery

Chores:
- Downgrade __version__ to 2.7.0 in brainpy/__init__.py

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b70c98ab3c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.