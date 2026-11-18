# Issue

**Title:** fix: restore Python version badge metadata

## Description

## Summary

- Add Python 3.9 through 3.14 classifiers to the package metadata.
- Keep the existing PyPI Python-version badge in the README and documentation.
- Add tests that validate classifiers against `requires-python` and the running CI interpreter.

## Why

The Hatchling-built release included `Requires-Python` but no Python classifiers, causing the PyPI `pyversions` badge to display `missing`. Explicit classifiers are standard PyPI metadata and improve package discoverability and tooling support. Manual declarations were chosen over a Hatch hook because a hook would still need a maintained supported-version list while adding build complexity.

## Validation

- `uv run pytest` (89 passed)
- `uv run ruff check pyproject.toml tests/test_python_support_metadata.py`
- `uv run ruff format --check tests/test_python_support_metadata.py`
- Built wheel metadata verified for Python 3.9 through 3.14 classifiers

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c3fb6b2bda9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.