# Issue

**Title:** Add comprehensive tests for metric calculations

## Description

## Summary
- Adds 16 new comprehensive tests for the metrics module, addressing issue #733
- Increases total test count from 17 to 33 tests
- Tests focus on numerical correctness (not just shape validation) and edge cases

## Changes

### New tests for `tedana/metrics/_utils.py` (5 tests)
- `test_determine_signs`: Tests skew-based sign determination for components
- `test_flip_components`: Tests component sign flipping with various sign patterns
- `test_check_mask`: Tests zero-variance detection in masked data
- `test_dependency_resolver`: Tests metric dependency resolution logic
- `test_add_external_dependencies`: Tests external regressor dependency addition

### New tests for `tedana/metrics/dependence.py` (9 tests)
- `test_calculate_varex_correctness`: Verifies variance explained formula
- `test_calculate_varex_norm_correctness`: Verifies normalized variance sums to 1.0
- `test_calculate_z_maps_correctness`: Verifies z-scoring and z_max clamping
- `test_calculate_dependence_metrics_correctness`: Verifies weighted average kappa/rho calculation
- `test_compute_dice_correctness`: Verifies Dice similarity calculation with known values
- `test_compute_kappa_rho_difference_correctness`: Verifies kappa-rho difference formula
- `test_generate_decision_table_score_correctness`: Verifies ranking logic
- `test_compute_countsignal_correctness`: Verifies signal voxel counting
- `test_compute_countnoise_correctness`: Verifies noise voxel counting

### New tests for `tedana/metrics/collect.py` (2 tests)
- `test_get_metadata`: Tests metadata generation for component table columns
- `test_get_metadata_external_regressors`: Tests external regressor metadata

## Test plan
- [x] All 33 tests pass (`pytest --skipintegration tedana/tests/test_metrics.py`)
- [x] Code passes black formatting
- [x] Code passes flake8 linting
- [x] Code passes isort

🤖 Generated with [Claude Code](https://claude.ai/code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9bf13357b7b9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.