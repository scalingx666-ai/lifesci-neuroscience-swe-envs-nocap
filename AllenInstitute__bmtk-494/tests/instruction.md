# Issue

**Title:** DPointNet: accept Keras master variables in eager weight-carrier projection

## Description

## Problem

On `develop` (`972ed590`), the default compute-temporal route crashes at the eager `from_input` grey-screen `InputState` warm-up with CSR FP32 masters:

```
TypeError: @tf.custom_gradient grad_fn must accept keyword argument 'variables',
since function uses variables: [<tf.Variable 'glif3_cell/sparse_recurrent_weights:0' ...>]
  ... glif3_cell.py calculate_i_rec_with_custom_grad -> csr_spike_ops.py fused_recurrent_weight_carry
```

`GLIF3Cell` passes its Keras 3 `recurrent_weight_values` into `fused_recurrent_weight_carry`. Eager `tf.custom_gradient` exempts only variables passed directly as arguments. Here the argument is the Keras wrapper, while the projection reads the wrapped `tf.Variable`, so TensorFlow raises. Graph-mode training is unaffected, so the failure only appears in eager rollouts. Users then fall back to FP32 temporal gradients, which also disables streamed statistics and the direct recorded adjoint.

## Fix

Before the `custom_gradient`, pass the backing `tf.Variable` when `csr_weights` wraps one. Weight credit still flows through the carrier and the gradient for `weights` stays `None`, so gradients and graph behavior are unchanged. Keras 2 masters are already plain `tf.Variable`s, so this is a no-op there.

## Tests

- New `test_eager_carrier_accepts_keras_master_variable` (CPU, stubbed projection): fails on `develop`, passes with the fix; skipped on Keras 2.
- `tests/simulator/dpointnet`, Python 3.13 / TF 2.21 / RTX 3090: 5162 passed, 70 skipped.
- `test_recurrent_accumulation.py` on the Python 3.8 / TF 2.13 CI environment: new test skipped as intended.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `972ed590fdf6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.