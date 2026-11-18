# Issue

**Title:** Speed up HMM training

## Description

## Summary

HMM training is 50-70x faster per epoch on CPU and GPU, and the initializations no longer re-compile the model. Results are unchanged.

Timings: TDE-PCA data with 2 sessions, 160k samples, 120 channels, 8 states, sequence length 200, batch size 256 (4 batches per epoch).

| | `main` | this PR |
|---|---|---|
| Epoch, CPU (Apple M-series) | 75 s | 1.1 s |
| Epoch, RTX A5000 (hbaws44) | 5.6 s | 0.11 s |
| Epoch, V100 (compg017) | 8.3 s | 0.16 s |
| Full fit (3 initializations + 20 epochs), CPU | about 50 min | 24 s |
| Initializations, RTX A5000 | 16.6 s | 10.6 s (2 one-off compilations) |

## Changes

1. **`SeparateLogLikelihoodLayer`** (most of the gain). `MultivariateNormalTriL.log_prob` broadcast each state's Cholesky factor against every time point, so the gradient of the triangular solve formed a D x D outer product per time point. All time points are now solved together as one right-hand side per state. Shared parameters (HMM) and per-sequence parameters (HIVE) are both handled.
   - Log-likelihood plus gradient for one batch: CPU 19.5 s -> 0.16 s; V100 272 ms -> 19 ms.
2. **`HiddenMarkovStateInferenceLayer`.** The forward-backward recursions use `tf.scan` instead of writing each step into the full tensor with `tensor_scatter_nd_update`. They are module-level functions compiled with XLA.
   - Forward-backward for one batch: RTX A5000 32 -> 10 ms; V100 52 -> 9 ms; CPU 21 -> 7 ms (`log`).
   - Without XLA, `tf.scan` gained nothing on the GPUs: each step was a separate kernel launch.
   - An associative (parallel) scan was tried. At sequence length 200 it is no faster than the XLA-compiled scan, and it is slower with more states (16 states: 23 vs 16 ms), so it is not used.
3. **Initializations.** `reset()` re-compiled the model for every initialization, and Keras then re-traced the training step.
   - `compile()` (now run in the strategy scope) builds the optimizer variables and keeps their initial values, including the EMA decay.
   - `reset()` restores those values with the weights instead of re-compiling. It re-compiles only if they were not recorded. To change optimizer settings, call `compile()`.
   - What remains is two one-off XLA compilations: one for full batches, and one for the last, smaller batch (28 sequences here).

## Verification (against `main`)

- **Baum-Welch:** gamma and xi agree to 1e-12 (`log`) and 1e-15 (`rescale`).
- **Log-likelihood:** values and gradients agree to float32 rounding (about 3e-7), for shared and per-sequence parameters.
- **One training epoch from the same initial covariances:**
  - loss identical (169.1812439);
  - transition probabilities agree to 6e-6;
  - covariances agree to 2e-3 relative (Adam on float32 gradients).
- **Initializations:** reusing the compiled model gives exactly the same losses as re-compiling (the same best initialization, then the same training losses).

- **All models train with losses identical to `main`:** HMM, HMM-Poisson, Dirichlet HMM, HIVE, DyNeMo, M-DyNeMo, DIVE, DyNeStE and SC-DyNeMo (initialization plus one epoch).
- **Other paths:** FisherKernel (eager `GradientTape`), sequences of one time point, and MirroredStrategy with `compile()` inside or outside the scope (2 replicas) all work.
- **Full fit on GPU (3 initializations + 20 epochs, same seed):**
  - same states in the same order;
  - free energy 166.019 (`main`) vs 166.022;
  - Viterbi paths agree on 93%.
  - The differences come from float32 rounding amplified by Adam: perturbing `main`'s own data by 1e-7 relative gives the same agreement with `main` (94%).

## Other fixes

- **HMM with a distribution strategy (also broken on `main`):** the transition and initial-state updates returned by the custom gradient were summed over replicas. Each replica now returns its share of the mean.
  - `main` crashed with 2 replicas.
  - Now the rows of the transition matrix sum to 1, and initialization and training work.
- **XLA availability:** the forward-backward is compiled without XLA on macOS GPUs (tensorflow-metal), where TensorFlow does not support it, following Keras' `model_supports_jit` (`tf_ops.xla_supported()`).

## Optimizer construction

- `ModelBase.compile` builds the optimizer with a `_make_optimizer()` hook in the distribution strategy scope, so subclasses no longer override `compile` or open the scope themselves.
  - `MarkovStateInferenceModelBase._make_optimizer` wraps the base optimizer with the EMA optimizer for the transition and initial-state probabilities.
  - HMM-Dirichlet only overrides `_base_optimizer()` (for `optimizer_kwargs`) instead of copying `compile`.
- `optimizers.get_variables()` lists the variables of an optimizer and of the optimizers it wraps (used by `compile`/`reset`).
- **Behavior changes for HMM, HMM-Poisson, HIVE and HMM-Dirichlet:**
  - an optimizer passed to `compile()` is used as the base optimizer for the parameters other than the transition and initial-state probabilities (it was ignored before);
  - `config.gradient_clip` is applied to the base optimizer (it was ignored before, except in HMM-Dirichlet).

## Note

The training step is no longer re-traced for each initialization. For models that sample during training (DyNeMo and other inference-network models), the random numbers drawn after initialization therefore differ from `main` with the same seed. The restored optimizer and weights are the same as on `main`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa4b28a5f758`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.