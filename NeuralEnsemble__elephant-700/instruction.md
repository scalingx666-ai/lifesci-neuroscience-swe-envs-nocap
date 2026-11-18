# Issue

**Title:** Shorten pyproject.toml description to comply with PyPI Summary field limit

## Description

# Desc
The `description` field in `pyproject.toml` maps to the [Summary](https://packaging.python.org/en/latest/specifications/core-metadata/#summary)
metadata field, which PyPI enforces a 512-character cap on. Observed on push to test-pypi with the error:
```
'summary' field must be 512 characters or less. See https://packaging.python.org/specifications/core-metadata for more information.
```
The previous value was a multi-sentence paragraph that exceeded this limit, causing upload rejection on TestPyPI.

# Fix
Replaced with a concise one-liner as required.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62c532f129eb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.