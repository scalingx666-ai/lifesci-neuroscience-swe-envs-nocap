# Issue

**Title:** Expose OptunaSearchCVClassifier.decision_function only when the estimator has it

## Description

## Problem
With `optuna=True` and a ROC-AUC paradigm (all binary paradigms), scoring fails for any classifier that has `predict_proba` but no `decision_function`, e.g. skorch / braindecode nets or `GaussianNB`:

```
AttributeError: This 'Pipeline' has no attribute 'decision_function'
```

`optuna-integration`'s `OptunaSearchCV` defines `decision_function` as a plain method that forwards to `best_estimator_`. scikit-learn's `BaseSearchCV` guards the same method with `available_if`, but `OptunaSearchCV` doesn't. So `hasattr(search, "decision_function")` is always `True`, scikit-learn's ROC-AUC scorer picks it over `predict_proba`, and the call fails inside the search.

## Change
`OptunaSearchCVClassifier` (MOABB's wrapper) now exposes `decision_function` through `sklearn.utils.metaestimators.available_if`, only when the fitted (or unfitted) estimator has it, the same rule as scikit-learn's searches.

## Tests
`test_optuna_search_roc_auc_without_decision_function`: an Optuna search over `GaussianNB` doesn't advertise `decision_function`, and `get_scorer("roc_auc")` succeeds.

## Verification (Voyager, isolated serial runs)
- `ruff check` + `ruff format --check` on the changed files: clean.
- New test(s): **fail on unmodified `develop`**, pass on this branch.
- Full test file of the touched module on this branch, compared with a `develop` baseline run in the same environment: no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fbff4da214c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.