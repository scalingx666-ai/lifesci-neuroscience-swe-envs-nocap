# Issue

**Title:** Fix user-facing API bugs

## Description

## Summary

Fixes the user-facing API issues tracked in #163:

- Dispatch `preprocess_for_challenge` by concrete challenge-specific `Algorithms` enum subclasses and reject raw string values.
- Raise descriptive `FileNotFoundError` exceptions for missing MRI outputs in MissingMRI inference.
- Preserve user-configured Loguru handlers when importing BraTS.
- Use lazy output lookup and restore logging state in tests.
- Keep the tutorial logging example compatible with the package default logging state.

## Verification

- `uv run --python 3.9 pytest`
- `uv run ruff check .`
- `uv run ruff format --check .`
- `mkdocs build --strict`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3d59414d778f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.