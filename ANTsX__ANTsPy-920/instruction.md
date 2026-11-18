# Issue

**Title:** COMP: Make pyproject.toml authoritative for version

## Description

We had version information hard-coded in `ants/__init__.py`, as well as in `pyproject.toml`.

Use `importlib.metadata` to get the version information in `ants/__init__.py`, so they won't get out of sync.

Also, bump python version minimum to 3.10, as we have dropped earlier wheels.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01a50724d8db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.