# Issue

**Title:** Follow up on get_default_dataloaders: dataset variants, input validation, one config-merge home

## Description

## What does this PR do?

, which added `get_default_dataloaders`.

- **Narrows the docstring.** The loaders were advertised as the ones a benchmark
  run uses, but 10 of the 24 model YAMLs override `data.neuro` — every EEG
  foundation model and all four sklearn baselines. On `eeg/motor_imagery`,
  `--model labram` moves `neuro.frequency` 120.0 -> 200.0, `notch_filter`
  [50, 60] -> [50] and `clamp` 20.0 -> None. Model configs stay out of scope
  here; the docstring now says so, and documents `**overrides` and the infra
  gotcha (extraction inherits `neuro.infra.cluster="auto"`, so the first call
  submits SLURM jobs where a cluster is available).
- **Adds `dataset`**, so multi-dataset tasks are reachable (`motor_imagery`
  ships 17 variants; only the default study was).
- **Validates `device` / `task`** via `_validate_inputs`, as `run_benchmark`
  does. A typo gave a bare `FileNotFoundError` with no list of valid tasks.
- **One home for the config merge.** `merge_task_config` and
  `_merge_dataset_config` in `experiment_config.py` own the
  base -> task -> dataset layering, including the `=replace=` source restore;
  `prepare_task_configs` and `get_default_dataloaders` both call them.

`dataset` is keyword-only: as a positional-or-keyword parameter it collides with
`**overrides`, and mypy rejects the existing `**{"neuro.frequency": 60.0}` call
style because a `dict[str, float]` could fill it. Worth deciding separately
whether `overrides` should become an explicit `dict[str, Any] | None` argument.

## Tests

- The config-merge test is annotated (which is what surfaced the mypy issue
  above) and asserts the merged study.
- New: `dataset="schalk2004bci2000"` resolves to the variant's study, and an
  unknown task raises `ValueError`.
- `prepare_task_configs` behaviour is already covered by `test_cli.py` and
  `test_registry.py`, which exercise the refactored merge path.

## Checklist

- [x] Tests added or updated
- [x] Docstrings updated for any changed public APIs (plus an `api.rst` entry,
      since the function is in `__all__`)
- [x] `pytest`, `mypy` and `ruff` pass locally

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff365b7fe81c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.