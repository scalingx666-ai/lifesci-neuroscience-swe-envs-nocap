# Issue

**Title:** fix: green-light CI — Dense fit-flag tracer, buffer-donation test pollution, L1 loss contract; Codecov token

## Description

## Summary

Makes the full `pytest brainpy/` suite (the CI command on Linux/macOS/Windows,
Py 3.13, against `braintools>=0.3.0`) **fully green: 4180 passed, 13 skipped, 0
failed**. Fixes one real source bug, one test-isolation defect, and two stale
test contracts; also wires the Codecov token/slug into CI.

### Source fix — `brainpy/dnn/linear.py`
`Dense.update` did `if share.load('fit', False) and self.online_fit_by is not None:`.
Inside a grad-/jit-traced fit step (`BPFF`/`BPTT`) the `fit` share value is a JAX
**tracer**, so `bool(tracer)` raised `TracerBoolConversionError`, breaking the
canonical Dense/RNNCell back-prop training example. Reordered to check the static
`*_fit_by` config first so the `and` short-circuits before the tracer is forced
when online/offline fitting is not configured. This also eliminates a cross-test
pollution: a fit that raised mid-trace left a stale traced `fit` in the global
`share` store, breaking the next test that ran `Dense.update`.

### Test isolation — `brainpy/running/jax_multiprocessing_test.py`
`test_vectorize_map_partial_chunk_clear_buffer` called
`jax_vectorize_map(..., clear_buffer=True)`, which triggers the **process-global**
`bm.clear_buffer_memory()` — deleting *every* live device buffer and poisoning
later test modules with "deleted/donated buffer" errors. Patched the wipe to a
no-op for the call (the same guard already used in `boost_misc_test` and
`train_analysis_glue_fixes_test`), keeping the code path covered without nuking
the shared session.

### Test contracts
- **`brainpy/train/back_propagation_test.py`** — rewrote the pinned-defect test
  into a regression test: asserts `Dense` trains under BPFF (finite losses,
  weight moves) and a subsequent plain forward pass does not raise (pollution
  guard).
- **`brainpy/losses/comparison_coverage_test.py`** — `l1_loss` delegates to
  `braintools.metric.l1_loss` (>=0.3.0, the required/CI dependency), which reduces
  each sample to its mean absolute error then applies the batch reduction.
  Updated L1 expectations (`none -> [1.5, 3.5]`, `sum -> 5.0`, `mean -> 2.5`) and
  comments to the 0.3.0 contract; the prior numbers pinned stale 0.1.10 behaviour.

### CI — `.github/workflows/CI.yml`
Codecov upload now passes `token: ${{ secrets.CODECOV_TOKEN }}` and
`slug: brainpy/BrainPy` (kept `files: ./coverage.xml`, `fail_ci_if_error: false`).

## Test plan
- Full `pytest brainpy/` against `braintools 0.3.0`: **4180 passed, 13 skipped, 0 failed**.
- Targeted: `running/` + the two former victims pass (polluter neutralised);
  `losses/` 85 passed; `dnn/` + `back_propagation_test.py` + `transform_test.py` pass.

## Summary by Sourcery

Fix Dense layer fit-flag handling to work under gradient/JIT tracing, align L1 loss tests with the current braintools contract, prevent JAX multiprocessing tests from clearing global buffers, and wire Codecov token/slug into CI coverage uploads.

Bug Fixes:
- Ensure bp.dnn.Dense update logic only consults the traced fit flag when online/offline fitting is configured, avoiding TracerBoolConversionError during BPFF/BPTT training.
- Prevent the JAX multiprocessing clear-buffer test from deleting process-global device buffers and contaminating subsequent tests.

Enhancements:
- Convert the Dense fit-flag pinned-defect test into a regression test that verifies successful BPFF training, finite losses, weight updates, and absence of global share pollution.

CI:
- Configure the Codecov GitHub Action to use the repository slug and a secret token for uploading coverage reports.

Tests:
- Update L1 loss reduction expectations and comments to match the braintools>=0.3.0 mean-absolute-error contract.
- Strengthen Dense BPFF regression coverage to check loss finiteness, weight changes, and a clean post-fit forward pass.
- Guard the JAX multiprocessing clear-buffer test so it still exercises the clear_buffer path without affecting other tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d29d1643135`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.