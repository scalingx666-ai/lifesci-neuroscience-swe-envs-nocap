# Issue

**Title:** [MAINT] Update pyriemann mean import

## Description

## Summary
- Try the legacy pyriemann mean import first for older releases.
- Fall back to `pyriemann.geometry.mean.gmean` when the legacy module emits the deprecation warning or is unavailable.

## Why
Newer pyriemann versions deprecate `pyriemann.utils.mean`, which can fail when deprecations are treated as errors.

## Validation
- `python -W error::DeprecationWarning -c "import meegkit.trca"`
- `python -W error::DeprecationWarning - <<PY ... trca_regul(...) ... PY`
- `python -m pytest tests/test_trca.py -q`
- `python -m ruff check meegkit/trca.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1138a604c42c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.