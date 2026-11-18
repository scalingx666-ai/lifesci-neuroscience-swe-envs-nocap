# Issue

**Title:** Optimise the primary metric in Optuna searches with multi-metric scorers

## Description

## Problem
A paradigm can carry a multi-metric scorer, e.g. `scorer=["accuracy", "balanced_accuracy"]` (kept as a list by `_normalize_scorer`) or a dict. `_grid_search_static` only handled the dict form, and only for `GridSearchCV`:
- **List + grid search:** a list reached `GridSearchCV` with `refit=True`, which scikit-learn rejects for multi-metric scoring (`refit` must be a metric name).
- **Any multi-metric + `optuna=True`:** `OptunaSearchCV` accepts a single scorer only, so every trial failed:
  ```
  Trial 0 failed ... because of the following error: KeyError('test_score')
  ```

## Change
For multi-metric scorers (dict, list or tuple), the inner search uses the primary (first) metric:
- `GridSearchCV` refits on it;
- Optuna optimises it.

All metrics are still computed on the outer folds and reported as `score_<name>` columns. Single scorers are unchanged.

## Tests
`test_eval_grid_search_multimetric_scorer`, parametrised over `{list, dict} × {grid, optuna}`: a `WithinSessionEvaluation` with a param grid runs and reports both metrics on every fold. It fails on `develop` and passes here.

## Verification (Voyager, isolated serial runs)
- `ruff check` + `ruff format --check` on the changed files: clean.
- New test(s): **fail on unmodified `develop`**, pass on this branch.
- Full test file of the touched module on this branch, compared with a `develop` baseline run in the same environment: no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff80f98488c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.