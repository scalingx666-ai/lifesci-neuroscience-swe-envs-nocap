# Issue

**Title:** RF: exclude local jj/venv dirs from codespell scan

## Description

Adds `.jj` and `venv` to codespell's `skip` list in `pyproject.toml`. Both otherwise produce a flood of false positives and binary-decode warnings when running `tox -e lint` locally, even though they are gitignored (codespell honors its own skip list, not `.gitignore`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b36f9b602a22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.