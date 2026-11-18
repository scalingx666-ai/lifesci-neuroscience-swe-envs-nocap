# Issue

**Title:** fix(ci): repair adaptive pooling ZeroDivisionError and mypy numpy stubs

## Description

Fixes the two standing CI failures. Both are dependency drift since the last fully-green run (#859, 2026-06-19); neither was caused by the `_version.py` move (that only broke editable install, fixed in #866).

## Continuous Integration — test failure
`brainpy/dnn/pooling_layers_test.py::TestPool::test_AdaptiveMaxPool3d_v1[0,2,3,4]` → `ZeroDivisionError: integer modulo by zero` (4 failed / 4179 passed).

`_adaptive_pool1d` divided by `num_block = size // target_size`, which is **0 whenever `target_size > size`** — i.e. a spatial dimension smaller than its target (e.g. `AdaptiveMaxPool3d(target=[6,5,4])` on an input axis of size 2, for every `channel_axis` that doesn't consume it). It then built `reshape(-1, 0)`, and a newer jax evaluates `arr.size % math.prod(other_sizes)` inside reshape → `% 0`. Older jax tolerated it, so this surfaced as env drift.

Rewrote it with PyTorch-style adaptive bins:
```
out[i] = operation(x[floor(i*size/T) : ceil((i+1)*size/T)])
```
Windows are provably never empty, so no division by zero, and it handles both down-sampling and up-sampling (`target > size` repeats elements). Verified equal to the exact PyTorch adaptive-pool formula for mean & max across many shapes and under `vmap`. No existing test asserted pooled values (only shapes), so behavior for the working cases is unchanged in shape and now matches PyTorch in value. Added a positive-`target_size` guard.

## Type Checking — mypy failure
`numpy/__init__.pyi:737: Type statement is only supported in Python 3.12 and greater [syntax]`. numpy 2.5.1 ships PEP 695 `type` aliases in its stubs, which mypy rejects unless the analysis target is 3.12+. Bumped `[tool.mypy] python_version` `3.11` → `3.14`.

## Tests
Added `TestAdaptivePool1d` regressions: per-bin values vs. a reference PyTorch formula (mean & max, up/down-sampling), the previously-crashing `AdaptiveMaxPool3d` channel-axis cases, and the `target_size <= 0` guard.

## Verification
- `pytest brainpy/dnn/pooling_layers_test.py` → **68 passed**.
- `mypy` with `python_version=3.14` against numpy 2.5.1 / mypy 2.2.0 → **Success: no issues found in 11 source files**.

## Summary by Sourcery

Fix adaptive 1D pooling to avoid ZeroDivisionError when upsampling and align behavior with PyTorch-style adaptive bins, and update mypy configuration to support modern numpy type stubs.

Bug Fixes:
- Prevent ZeroDivisionError in `_adaptive_pool1d` when `target_size` exceeds the input size by replacing block-based pooling with PyTorch-style non-empty adaptive bins.
- Reject nonpositive `target_size` values in `_adaptive_pool1d` with a clear `ValueError`.

Enhancements:
- Document `_adaptive_pool1d` behavior and constraints, clarifying its PyTorch-style adaptive pooling semantics.

CI:
- Update mypy's `python_version` to 3.14 so type-checking works with numpy's PEP 695 `type` aliases in current stub versions.

Tests:
- Add regression tests for `_adaptive_pool1d` to validate per-bin mean/max results against a PyTorch-style reference across up/down-sampling cases.
- Add tests covering upsampling behavior, nonpositive `target_size` rejection, and previously failing `AdaptiveMaxPool3d` configurations with small spatial dimensions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b75464a7ee4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.