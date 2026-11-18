# Issue

**Title:** refactor(models): reuse Himalaya's linear kernel and scipy's log-sum-exp in ridge

## Description

, closing the duplication items from its review.

- `_linear_kernel` is replaced by Himalaya's `linear_kernel`, which builds the same kernel on the active backend in the working dtype and validates its input as Himalaya's estimators do. Verified on the numpy backend (float32 and float64 preserved) and on MPS (tensor stays on device).
- `_store_banded_state` recovers `feature_space_weights_` with `scipy.special.softmax` and the selected alpha with `scipy.special.logsumexp` instead of a hand-written shifted exponential.
- `_store_ordinary_state` and `_store_banded_state` unwrap a shared alpha with the same conditional.

No behaviour change: NaN inputs already raise on every path through Himalaya's own validation, and the kernel-form and banded parity tests cover the rewritten recovery. `uv run poe ok` passes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65c2f34c46ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.