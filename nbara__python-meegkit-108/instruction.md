# Issue

**Title:** [MAINT] Update minimum Python to 3.10

## Description

## Summary
- raise the package minimum supported Python version from 3.9 to 3.10
- drop Python 3.9 from the GitHub Actions test matrix
- update the README support statement to match the packaging metadata

## Testing
- ./.venv/bin/python -m pytest tests/test_cov.py -q

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `889ce47ce9f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.