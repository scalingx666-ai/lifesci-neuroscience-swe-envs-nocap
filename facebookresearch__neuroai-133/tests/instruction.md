# Issue

**Title:** Fix _check_requirements to work with git+https:// URL requirements

## Description

## Summary

- `_check_requirements()` crashed with `ModuleNotFoundError: No module named 'git+https://github'` when a study's `requirements` tuple contained `git+https://...` URLs (e.g. `Lebel2023Natural`).
- The name-extraction logic now detects URL-based requirements via `://` and parses the package name from the URL path (stripping `.git` suffix and `@commit` ref).
- Also wraps `importlib.util.find_spec` in try/except, since it can raise `ModuleNotFoundError` instead of returning `None` for some module names.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8778d6c1ea42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.