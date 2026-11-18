# Issue

**Title:** Save best_estimator_ of a search over a torch pipeline like an unwrapped one

## Description

## Problem
With `save_model=True`, `_save_model_cv` saves torch pipelines (skorch / braindecode) step by step: `save_params` for the net and a pickle for the other steps. When the pipeline is wrapped in a hyper-parameter search (`GridSearchCV`, or `OptunaSearchCVClassifier` with `optuna=True`), `_check_if_is_pytorch_steps` looks at the search object, which has no `named_steps`, so the whole search is pickled. That pickle contains the live net and its device tensors.

We hit this on Intel Gaudi (HPU), where the pickle fails outright. On CUDA it produces model files that need a GPU to load. Either way, search-wrapped and unwrapped torch pipelines are saved inconsistently.

## Change
When the fitted model exposes `best_estimator_` and that estimator contains a torch step:
- save the refitted `best_estimator_` exactly like an unwrapped torch pipeline;
- write `best_params_<fold>.json` with the selected hyper-parameters.

Searches over non-torch pipelines are pickled as before.

## Tests
- `test_save_model_cv_search_over_pytorch_pipeline`: a `GridSearchCV` over `FunctionTransformer` + `NeuralNetClassifier` produces the per-step files (no whole-search pickle) and `best_params_0.json`.
- `test_save_model_cv_search_over_sklearn_pipeline_unchanged`: a search over a scikit-learn estimator is still pickled whole, with no JSON.

## Verification (Voyager, isolated serial runs)
- `ruff check` + `ruff format --check` on the changed files: clean.
- New test(s): **fail on unmodified `develop`**, pass on this branch.
- Full test file of the touched module on this branch, compared with a `develop` baseline run in the same environment: no new failures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `afb751b52aab`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.