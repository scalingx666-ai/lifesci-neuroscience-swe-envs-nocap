# Issue

**Title:** Validate Monte Carlo iteration counts

## Description

.

Changes proposed in this pull request:

1. Validate explicit Monte Carlo iteration counts when creating `FWECorrector`.
2. Preserve `None` so estimator specific defaults continue to apply.
3. Cover valid Python and NumPy integers and reject zero, negative, Boolean, noninteger, and string values.

Validation:

1. `python -m pytest nimare/tests/test_correct.py -q`
2. `make lint`
3. Clean main baseline: 1304 passed and 263 skipped.

## Summary by Sourcery

Validate explicit Monte Carlo iteration counts for positive integer values.

Bug Fixes:
- Validate Monte Carlo iteration counts while preserving estimator-specific defaults when no count is provided.

Tests:
- Add coverage for supported Python and NumPy integer counts and invalid Monte Carlo iteration values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e11d0e012623`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.