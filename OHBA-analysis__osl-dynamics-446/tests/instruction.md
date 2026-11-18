# Issue

**Title:** Speed up DyNeMo and DyNeStE training

## Description

## Summary

DyNeMo, M-DyNeMo, SC-DyNeMo and DIVE train 2x faster per epoch on GPU and up to 5.7x faster on CPU. DyNeStE trains 2-4x faster. Results are unchanged to float32 rounding.

Timings: 8 modes, sequence length 200, batch size 128, layer normalization (the settings of the TDE-DyNeMo example).

| | CPU (Apple M5) | V100 (compg017) | RTX A5000 (hbaws45) |
|---|---|---|---|
| 80 channels | 2877 → 502 ms/step | 177 → 89 ms/step | 185 → 88 ms/step |
| 38 channels | 595 → 282 ms/step | 67 → 46 ms/step | 65 → 36 ms/step |
| DyNeStE, 80 channels | 807 → 205 ms/step | 102 → 43 ms/step | 98 → 27 ms/step |
| DyNeStE, 38 channels | 349 → 203 ms/step | 57 → 38 ms/step | 44 → 24 ms/step |

## Changes

1. **`LogLikelihoodLossLayer`** (most of the CPU gain).
   - TensorFlow's gradient of the Cholesky decomposition is slow for a covariance matrix at every time point: it took about 1.5 s of a 3.2 s step on CPU.
   - The new `_mvn_log_prob` keeps the forward pass (`MultivariateNormalTriL.log_prob`) and has an analytic gradient: `dlogp/dmu = Σ⁻¹(x − μ)` and `dlogp/dΣ = −½(Σ⁻¹ − Σ⁻¹(x − μ)(x − μ)ᵀΣ⁻¹)`.
   - It reuses the Cholesky factor from the forward pass. `Σ⁻¹` comes from `cholesky_solve` with batched identity matrices; broadcasting the identity in `cholesky_solve` is 2x slower on GPUs.
2. **`MixVectorsLayer`, `MixMatricesLayer`, `MixSessionSpecificParametersLayer`.**
   - The mixtures were calculated by broadcasting to an array with shape (batch, time, modes, channels, channels), which is 5 GB at the settings above.
   - They now use `einsum`, which is one matrix multiplication.
   - The indices are written out (`btj,jkl->btkl`): with an ellipsis, `einsum` becomes a batch of 25,600 small matrix multiplications, which made GPU training 2x slower than `main`.
3. **`ModelBase.reset_optimizer()`** (new, public). It restores the optimizer variables recorded in `compile()` without tracing the training step again.
   - `reset()` and HMM `fine_tuning` use it.
   - DyNeMo `fine_tuning` and `dual_estimation` still call `compile()` for each session. Tracing the training step again restarts the random draws, so each session's result doesn't depend on the sessions before it.

4. **`CategoricalLogLikelihoodLossLayer`** (DyNeStE).
   - The log-likelihood of each state used `MultivariateNormalTriL.log_prob`, which applies the state's Cholesky factor to every time point separately (the slow pattern #444 removed from `SeparateLogLikelihoodLayer`).
   - It now uses `_separate_log_likelihood`, which solves all time points together for each state.
   - `_separate_log_likelihood` is the calculation from `SeparateLogLikelihoodLayer`, moved to a module-level function so that both layers use it. HMM and HIVE results are bit-identical to `main`.

Observation model, forward and backward, at 80 channels:

| | CPU | V100 | RTX A5000 |
|---|---|---|---|
| `main` | 2638 ms | 142 ms | 167 ms |
| this PR | 362 ms | 59 ms | 71 ms |

XLA was tried. On CPU it is 12x slower for the Cholesky decomposition, so it isn't used.

## Verification (against `main`, same seeds)

Tested on DyNeMo (full covariances with `loss_calc` mean and sum; diagonal covariances with KL annealing and layer normalization), M-DyNeMo, SC-DyNeMo and DIVE. Each test covers the initial loss and gradients (with and without sampling), 3 training epochs, `get_alpha` and `free_energy`. Also tested: DyNeMo `fine_tuning`/`dual_estimation` (3 sessions, with and without sampling) and HMM `fine_tuning`.

- **CPU and V100:**
  - initial losses are identical, and the gradients agree to about 1e-7 relative;
  - training losses, trained weights, alphas and `fine_tuning`/`dual_estimation` results agree to about 1e-7;
  - free energy is identical (or agrees to 1e-7).
- **RTX A5000:**
  - initial losses are identical, and the training losses agree to 1e-7;
  - gradients agree to about 1e-4, because TensorFlow uses TF32 for matrix multiplications on Ampere GPUs;
  - against a float64 reference, `main`'s gradients there are only accurate to 3e-4 and this PR's to 2e-4;
  - with TF32 off, everything agrees to 1e-7.
- **One configuration drifts more:** with diagonal covariances, KL annealing and layer normalization, the trained weights differ by up to 1e-4 (CPU).
  - This is float32 rounding amplified by Adam: perturbing `main`'s own initial weights by 1e-7 relative gives a similar difference (8e-5).
- **MirroredStrategy (2 V100s):** the training losses are identical, and the weights and `dual_estimation` results agree to 1e-6.
- **HMM `fine_tuning`:** bit-identical to `main`.
- **DyNeStE** (full covariances; diagonal covariances with Gumbel-Softmax and KL annealing), CPU and V100:
  - initial losses and free energy are identical;
  - gradients agree to about 1e-6, training losses to 1e-7, and trained weights to 3e-5.
- **HMM and HIVE** (initial loss and gradients, 3 epochs, alphas, free energy), CPU and V100: bit-identical to `main`.
- **Accuracy against float64:** with the new gradient and mixing, the gradients are as accurate as `main`'s (1e-7 to 1e-6 without TF32).

## Notes

- Second derivatives through `LogLikelihoodLossLayer` aren't available with the custom gradient. Nothing in osl-dynamics uses them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c0242309ca0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.