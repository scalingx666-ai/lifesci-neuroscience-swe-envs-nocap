# Issue

**Title:** MNT: fix ruff settings

## Description

Reorder ruff rules as in the [documentation](https://docs.astral.sh/ruff/rules/).

This helped find a misnamed set of rules: `TCH` → `TC`. The name change occurred in [ruff 0.8.0](https://astral.sh/blog/ruff-v0.8.0#new-error-codes-for-flake8-type-checking-rules).


Addresses this Scientific Python Development Guide [Repo-Review](https://learn.scientific-python.org/development/guides/repo-review/?repo=nipy%2Fnibabel&ref=HEAD&refType=branch&show=all) warning:
> VPP001: Validate pyproject.toml
> Invalid pyproject.toml! Error: `tool.ruff.lint` cannot be validated by any definition:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0953cc79c4e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.