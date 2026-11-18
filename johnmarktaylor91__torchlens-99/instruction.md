# Issue

**Title:** fix(loop-detection): group param-sharing ops by func + param_barcodes

## Description

## Summary
- Fixed `_merge_iso_groups_to_layers` Pass 2 to group by `(func_applied_name, sorted(parent_param_barcodes))` instead of `parent_param_barcodes` alone
- Different ops on the same params (e.g. `__getitem__` vs `__add__`) are no longer incorrectly merged into one layer
- Updated docstrings in `_detect_and_label_loops` (Rule 1) and `_merge_iso_groups_to_layers` to reflect the correct grouping rule
- Restructured `test_outputs/` into `reports/` and `graphs/` subdirectories for cleaner organization
- Removed all private bug number references (Bug #N) from test suite comments, docstrings, and class names
- Updated notebook (`ui_sandbox.ipynb`) paths to match new directory structure

## Test plan
- [x] `pytest tests/test_real_world_models.py::test_vit_mae -xvs` (already passing)
- [x] `pytest tests/test_validation.py -x -q` (already passing)
- [x] 282 tests pass across all modified test files
- [x] `grep` confirms zero remaining bug number references in tests/
- [x] Fresh `rm -rf tests/test_outputs` + test run confirms `reports/` and `graphs/` created correctly

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8c8e94c965c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.