# Issue

**Title:** Fix stale MANIFEST.in filenames and the LogVariance+LDA pipeline link

## Description

Two small independent fixes; no change to library behaviour.

### `MANIFEST.in`

Three of its six directives named files that don't exist — `README.rst`, `LICENSE.txt`, `NOTICE.txt` — so every `python -m build --sdist` printed three `warning: no files found matching ...` lines. The repo ships `README.md` and `LICENSE`, and no notice file at all.

The sdist contents don't change: setuptools already included the readme via `project.readme` and `LICENSE` via its default `license-files`. Verified by building the sdist before and after — identical 216-entry file list, three fewer warnings.

### `docs/prepare_paper_results_tables.py`

`LogVariance+LDA` linked to `pipelines/LogVar_grid.yml`, which is `name: Log Variance SVM grid` and classifies with `SVC`; the next line maps `LogVariance+SVM` to that same file. The LDA row now links to `pipelines/LogVar.yml` (`name: Log Variance LDA`).

The `#L7` fragment on the SVM entry is dropped — line 7 is the shared `LogVariance` step, not the `SVC` one. Regenerating the tables from `results/` changes exactly those two links and nothing else.

Changelog entries added under Code health and Bugs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29808c3eae48`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.