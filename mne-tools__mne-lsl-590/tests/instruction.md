# Issue

**Title:** Maintenance: bibclean 1.0, pre-commit hooks, cibuildwheel and locked dependencies

## Description

Groups the pending maintenance updates:

- bibclean 1.0.0: drops `--exit-non-zero-on-fix` (now the default) and reformats `doc/references.bib`.
- pre-commit: uv-pre-commit 0.13.0, ruff 0.17.0 (#584).
- cibuildwheel 4.3.1 (#591).
- `uv.lock`: urllib3 2.8.0 (#586), virtualenv 21.7.13 (#587), tornado 6.5.9 (#588).

, , , , .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d0ad62f08c58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.