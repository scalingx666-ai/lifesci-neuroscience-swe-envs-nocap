# Issue

**Title:** ci: re-add Python 3.14 to test matrix

## Description

Python 3.14 was previously deferred in 57c849c because **flake8/pyflakes** was not yet 3.14-compatible.

The project has since migrated from flake8 to **ruff** (which is a native Rust binary and doesn't depend on Python version support for linting). This removes the original blocker.

Local testing with Python 3.14 confirms:
- All dependencies resolve successfully
- All tests pass

Ci for 3.14 will be faster once #161 is merged

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0da4c8c69cb4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.