# Issue

**Title:** Make functions and classes defined in .py pipeline configs picklable, and keep saved models loadable

## Description

## Problem

`parse_pipelines_from_directory` (used by `moabb.benchmark`) runs every `.py` pipeline config with
`importlib.util.spec_from_file_location("custom", path)` and never puts the module in `sys.modules`. pickle stores a
function or class by module name, so nothing a config defines can be pickled:

    PicklingError: Can't pickle <function _zscore at 0x...>: import of module 'custom' failed

We hit this in the MOABB benchmark rerun with `save_model=True` and a `FunctionTransformer(_zscore)` defined in a
pipeline file (the workaround was to move `_zscore` to an importable module). `pickle.dumps` of the parsed pipeline
fails the same way, and all configs share the module name `custom`.

Two related problems showed up while testing:

- With `n_jobs > 1` the fold model is saved inside a joblib worker, which cannot import a config module, so
  `save_model` fails there even once the main process can pickle.
- Models saved by the evaluations could not be loaded when a step has no `__sklearn_is_fitted__` (e.g. LDA, SVC,
  StandardScaler, pyRiemann's CSP, TangentSpace, MDM): after each fit `_ensure_fitted` stores a method bound to a local function on such
  steps, which pickle saves as `getattr(step, "_sklearn_is_fitted_true")`. `pickle.load` of `fitted_model_0.pkl`
  then raises `AttributeError: 'CSP' object has no attribute '_sklearn_is_fitted_true'`. No test loaded a saved model.

## Changes

1. Each `.py` config runs as its own module, put in `sys.modules` before it is executed (the importlib recipe), under
   a name derived from its absolute path: `moabb_pipeline_config_<file name>_<sha256(path)[:12]>`.
   - Configs with the same file name in different directories do not collide.
   - A new Python session that parses the same file first gets the same name, so it can unpickle saved models.
   - A file parsed again in the same process gets a new name (`..._1`), so objects of the earlier parse stay picklable.
   - A config that raises, or has no `PIPELINE`, is removed from `sys.modules` again (same `ValueError` as before).

   The module is also registered with `cloudpickle.register_pickle_by_value` (standalone cloudpickle, a joblib
   dependency since joblib 1.6, and `joblib.externals.cloudpickle` for older joblib). Otherwise cloudpickle would now
   pickle these objects by reference, and loky workers (`n_jobs > 1`), which cannot import the module, would fail; with
   it they keep receiving them by value, as before.
2. `_save_model_cv` falls back to cloudpickle when `pickle.dump` cannot store an object by reference (`PicklingError`
   or `AttributeError`; the file is truncated and rewritten). This covers models saved in workers. The file still
   loads with `pickle.load`, in a worker-saved model even without parsing the config.
3. `_ensure_fitted` stores the module-level function `moabb.evaluations.utils._sklearn_is_fitted_true` on the
   estimator instead of a bound local method, so saved models load.

## Tests

`moabb/tests/test_reference_pipelines.py`, with a temporary config that defines a function used in a
`FunctionTransformer` and a transformer class:

- the parsed pipeline survives `pickle.dumps`/`pickle.loads`, unfitted and fitted (same function object, same class,
  same predictions);
- two `pipeline.py` configs in different directories each keep their own function after a round trip;
- a config parsed twice: objects of both parses stay picklable;
- the parsed pipeline reaches loky workers (`Parallel(n_jobs=2)`); this one passes on develop too and guards the
  by-value registration;
- `WithinSessionEvaluation(save_model=True)` with `n_jobs=1` and `n_jobs=2`, then `pickle.load` of every saved model.

`moabb/tests/test_evaluations.py::test_saved_fold_models_can_be_unpickled`: `Covariances + CSP + LDA` with
`save_model=True`, then `pickle.load` and `check_is_fitted`.

On develop, 6 of the 7 new tests fail (`PicklingError ... module 'custom'`, `AttributeError ... '_sklearn_is_fitted_true'`);
on this branch they pass, and so do `test_reference_pipelines.py`, `test_benchmark.py` and `test_evaluations.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed1aacdb39a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.