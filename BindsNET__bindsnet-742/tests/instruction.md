# Issue

**Title:** fix: resolve merge conflict markers in CI workflows and upgrade Actions

## Description

## Summary

The CI workflows currently contain **unresolved git merge conflict markers** (`<<<<<<< HEAD`, `=======`, `>>>>>>> origin`), making all CI checks non-functional.

- **Resolve conflicts** in `python-app.yml` and `pythonpackage.yml` by choosing the `origin` side: Python 3.13 in the test matrix, Poetry 2.1.2. This is consistent with `pyproject.toml` (`python = ">=3.10,<3.14"`) and merged PR #710 (Python 3.13 support).

- **Upgrade GitHub Actions** across all 3 workflow files:
  - `actions/checkout`: v2/v3 → v4
  - `actions/setup-python`: v2/v4 → v5

## Test plan

- [ ] CI workflows should now parse as valid YAML
- [ ] Test matrix should cover Python 3.10, 3.11, 3.12, 3.13

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ffe6a101ba1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.