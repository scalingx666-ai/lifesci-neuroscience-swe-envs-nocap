# Issue

**Title:** chore(ci): fix codespell pre-commit, whats_new changelog, and test isolation

## Description

Fixes `codespell` pre-commit on `infarction`/`UNER`, updates `docs/source/whats_new.rst` for PRs #1350/#1353/#1355/#1356, scopes `caplog` in `test_cache_dataset` to `logger='moabb'`, and pins `MOABB_DOWNLOAD_PROVIDER='auto'` in `test_erpcore2021_nemar.py` and `test_zhou2016_nemar.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `16730554d53f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.