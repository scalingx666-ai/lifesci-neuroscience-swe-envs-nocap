# Issue

**Title:** fix(validation): resolve 14 test failures across validation, labeling, and warnings

## Description

## Summary
- **Param sharing invariant** (12 failures): Different operations consuming the same parameter (e.g. `isinf`, `expand`, `nan_to_num` on embedding weights) were incorrectly required to share `layer_label_no_pass`. Fixed by including `func_applied_name` in the grouping key.
- **Unused input validation** (1 failure): DistilBert's unused `token_type_ids` had `func_applied=None`, causing crash during validation replay. Added early-return guard.
- **Pass labeling consistency** (1 failure): SSD300 train had pass numbering gaps because pass>1 entries used their own `layer_type` instead of inheriting from first pass. Fixed to inherit both `layer_type` and `layer_type_num`.
- **Numpy 2.0 deprecation warning**: Replaced `np.array(cpu_data)` with `cpu_data.detach().numpy()`.
- **External warnings**: Suppressed 6 third-party warnings via `pyproject.toml` filterwarnings.
- **4 regression tests** with 2 helper model classes covering unused inputs and shared-param-different-ops scenarios.

## Test plan
- [x] Verified param sharing fix with `test_vit` (12 affected models share same root cause)
- [x] Verified unused input fix with `test_distilbert`
- [x] Verified pass labeling fix with `test_ssd300_vgg16_train`
- [x] Verified numpy warning fix with warnings-as-errors
- [x] Ran 542 core tests — all pass, no regressions

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `178154956985`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.