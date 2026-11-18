# Issue

**Title:** MNT: let ruff use `requires-python`

## Description

The ruff manual recommends `requires-python` instead of `target-version` for projects using a `pyproject.toml` file:
	https://docs.astral.sh/ruff/settings/#target-version

Fixes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe424cdfdd15`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.