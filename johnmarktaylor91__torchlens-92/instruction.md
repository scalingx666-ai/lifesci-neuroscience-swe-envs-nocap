# Issue

**Title:** refactor(core): replace 17 flat module_* dicts with transient _module_build_data

## Description

## Summary
- Consolidated 17 intermediate `module_*` dict fields on ModelLog into a single `_module_build_data` dict
- These fields were only used as scratch space during postprocessing (steps 10-17) to accumulate module hierarchy data before constructing structured ModuleLog objects
- After `_build_module_logs` consumes the data, `_module_build_data` is re-initialized to a clean state
- Reduces ModelLog from ~143 to ~127 public fields

## Test plan
- [x] All 483 tests pass (excluding slow)
- [x] Focused `test_module_log.py` and `test_metadata.py` — 145/145 pass
- [x] `save_new_activations` re-run scenario works (dict re-initialized, not emptied)
- [x] Verified `model_log.modules["self"]` still works

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9bd2aa376b9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.