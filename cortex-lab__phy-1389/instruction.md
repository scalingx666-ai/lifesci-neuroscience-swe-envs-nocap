# Issue

**Title:** Start 2.1.1 development

## Description

## Summary

- advance the repository development version from `2.1.0` to `2.1.1.dev0`
- keep `pyproject.toml`, `phy.__version__`, and the editable package entry in `uv.lock` synchronized
- leave the README and documentation on `2.1.0`, which remains the current stable release

## Why

Development builds from `master` should no longer identify themselves as the immutable `2.1.0` release. The `.dev0` version also ensures the production publish helper refuses an accidental upload.

## Validation

- version consistency check across all three files
- `uv lock --check`
- `uv run --frozen phy --version`
- `uv run --frozen pytest -q phy/utils/tests/test_plugin.py`
- `uv build` and package metadata inspection
- `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41b957446497`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.