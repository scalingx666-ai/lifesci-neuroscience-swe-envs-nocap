# Issue

**Title:** Reuse braintools.init / braintools.metric in brainpy.initialize & losses

## Description

## Summary

Removes duplicated implementations in `brainpy.initialize` and `brainpy.losses` by delegating to the upstream `braintools` package (already a hard dependency, and already reused by `brainpy.measure`, `brainpy.math.surrogate`, `brainpy.visualization`, `brainpy.inputs`). Public API, pytree support, `dtype` handling and `bm.Array` return types are all preserved.

### `brainpy.initialize` (conservative reuse of `braintools.init`)
- `ZeroInit`, `Constant` (and `OneInit`), `Identity` now delegate their construction to `braintools.init.{ZeroInit,Constant,Identity}`, keeping brainpy signatures, the `<=2D` `Identity` validation and the 1D→square expansion.
- Seeded random initializers (`Normal`, `Uniform`, `Kaiming*`, `Xavier*`, `Lecun*`, `Orthogonal`, …) are **left untouched**: `braintools.init`'s random initializers are unseeded and use incompatible constructor signatures (`Normal(mean, std)`, no `seed`, `__call__(size)` without `dtype`), so replacing them would break reproducibility and the public API.

### `brainpy.losses` (reuse of `braintools.metric`)
The following now compute via `braintools.metric` inside brainpy's existing `tree_map`/`_multi_return` envelope (so **pytree inputs still work**):
`l1_loss`, `l2_loss`, `huber_loss`, `softmax_cross_entropy`, `sigmoid_binary_cross_entropy`, `log_cosh_loss`, `mean_squared_error`, `mean_absolute_error`, and regularization `log_cosh`, `smooth_labels`, `mean_square`, `mean_absolute`.

`ctc_loss` / `ctc_loss_with_forward_probs` delegate directly — this also **fixes a pre-existing crash** (`bm.log_softmax(<jax array>).value`, where jax arrays have no `.value`).

Left unchanged where braintools has no behavior-equivalent counterpart: `l2_norm` (different formula), `cross_entropy_loss`, `cross_entropy_sparse`/`cross_entropy_sigmoid`, `nll_loss`, `binary/multiclass_logistic_loss`, `multi_margin_loss`, `mean_squared_log_error`.

## Testing
- New co-located regression tests (`comparison_test.py`, `regularization_test.py`, extended `regular_inits_test.py`) assert numerical equivalence to `braintools` across reductions/axis and for pytree + `bm.Array` inputs.
- `pytest brainpy/initialize brainpy/losses` → **67 passed**.
- Non-JitFP `brainpy/dnn/linear_test.py` (heavy initializer consumer) → **16 passed**. (Pre-existing JitFP failures are unrelated and reproduce on `master`.)

## Summary by Sourcery

Delegate selected deterministic initializers and loss/regularization functions to the existing braintools implementations while preserving BrainPy’s public APIs and pytree/Array handling, and add regression tests to lock in equivalence and behavior.

Bug Fixes:
- Fix CTC loss functions by delegating to braintools.metric, resolving crashes when called with JAX arrays that lack a `.value` attribute.

Enhancements:
- Reuse braintools.init for ZeroInit, Constant/OneInit, and Identity initializers to avoid duplicated logic while keeping shapes, dtypes, and BrainPy-specific identity behavior intact.
- Reuse braintools.metric for core comparison losses and regularization helpers (L1/L2, Huber, softmax/sigmoid cross-entropy, log-cosh, mean absolute/squared errors, smoothing) while retaining BrainPy’s pytree and bm.Array envelopes.

Tests:
- Add regression tests for deterministic initializers to ensure value/dtype behavior and equivalence with braintools.init.
- Add comparison and regularization regression tests to ensure delegated losses and regularizers remain numerically identical to braintools.metric and preserve reduction defaults and pytree semantics.
- Add tests to validate CTC loss delegation and to confirm non-delegated legacy losses continue to run as before.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dccad83ba192`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.