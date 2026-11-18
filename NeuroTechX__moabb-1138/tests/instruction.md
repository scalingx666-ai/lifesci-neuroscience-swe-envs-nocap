# Issue

**Title:** Fix dataset download path integrity

## Description

.

Correct dataset download and discovery paths that could silently omit data, return nonexistent paths, repeatedly extract archives, or preserve an invalid Kojima manifest.

Includes focused regression coverage for each fixed loader path.

Tests:
- `pytest moabb/tests/test_dataset_fixes.py`
- `ruff check` and `ruff format --check` on changed Python files
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0fbe9de3a0b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.