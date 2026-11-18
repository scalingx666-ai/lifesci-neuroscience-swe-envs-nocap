# Issue

**Title:** Refactor key normalization and date parsing; remove unused stopwords …

## Description

…and workspace config creation

- Updated `_normalize_readchar_key` to handle carriage return (`\r`) in addition to newline (`\n`).
- Modified `_safe_dt` to include additional date formats for better compatibility.
- Removed unused `STOPWORDS` set and `TOKEN_RE` regex from `dashboard.py`.
- Eliminated the `_create_workspace_config` method from `WorkspaceManager` to streamline workspace setup.
- Updated `pytest` version in `pyproject.toml` to a compatible version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86b61c6d9a93`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.