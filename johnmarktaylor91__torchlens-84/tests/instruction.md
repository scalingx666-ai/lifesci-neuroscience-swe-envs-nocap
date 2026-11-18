# Issue

**Title:** refactor(validation): restructure into subpackage with data-driven exemption registries

## Description

## Summary

- Replaces monolithic `validation.py` (814 lines) with a `torchlens/validation/` subpackage: `__init__.py`, `core.py`, `exemptions.py`
- Consolidates the 141-line elif chain and three separate exemption mechanisms into four declarative registries: `SKIP_VALIDATION_ENTIRELY`, `SKIP_PERTURBATION_ENTIRELY`, `STRUCTURAL_ARG_POSITIONS`, `CUSTOM_EXEMPTION_CHECKS`
- Posthoc checks kept as redundant safety nets (belt-and-suspenders)
- Four secondary fixes: precise `torch.all()` guards replacing `mean==0/1` heuristic, verbose error logging on bare `except`, recursive `_deep_clone_tensors` helper, `MAX_PERTURB_ATTEMPTS=100` loop bound
- Adds 23 new tests (`tests/test_validation.py`) covering imports, registry consistency, perturbation, deep cloning, and integration through specific exemption paths

## Test plan

- [x] `pytest tests/test_validation.py -v` — 23/23 new tests pass
- [x] `pytest tests/test_toy_models.py -v` — 101/101 pass (main regression gate)
- [x] `pytest tests/test_metadata.py -v` — 102/102 pass
- [x] `pytest tests/test_decoration.py tests/test_module_log.py tests/test_param_log.py -v` — 173/173 pass
- [x] `python -c "from torchlens.validation import validate_saved_activations; print('OK')"` — import works
- [x] Zero regressions across all 399 existing tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e714b323063c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.