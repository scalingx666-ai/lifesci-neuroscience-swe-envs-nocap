# Issue

**Title:** feat(visualization): tri-state vis_buffer_layers with noise filter and hidden-buffer marker

## Description

## Summary
- Replace buffer visibility bool behavior with tri-state modes: `never`, `meaningful`, and `always`, while preserving legacy bool mapping (`True` -> `always`, `False` -> `never`).
- Add a hardcoded BatchNorm running-stat noise filter for `running_mean`, `running_var`, and `num_batches_tracked` in `meaningful` mode.
- Add a unified Graphviz hidden-buffer marker: `peripheries=2` plus a tooltip listing hidden buffer addresses on ops with hidden buffer parents.
- Phase 1 of 2: buffer nodes that remain visible keep the existing gray box treatment; cylinder shape changes are left for Phase 2.

## Tests
- `ruff format .`
- `ruff check . --fix`
- `mypy torchlens/`
- `pytest tests/ -m smoke -x --tb=short`
- `pytest tests/test_toy_models.py::test_batchnorm_train tests/test_toy_models.py::test_buffer_model tests/test_toy_models.py::test_buffer_rewrite_model -q`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a7edd003487`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.