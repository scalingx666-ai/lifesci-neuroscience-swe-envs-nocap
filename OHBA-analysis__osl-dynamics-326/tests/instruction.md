# Issue

**Title:** Enhance: TensorBoard callbacks

## Description

In the previous pull request (#321), I introduced `TensorBoardCallback` and `GradientMonitoringCallback` for logging weights, biases, and gradient updates during model training. This PR includes further enhancements and generalisations:

### Improvements:

- **`loss_indices` Argument:**
  - Users can now specify loss indices within their model outputs. This ensures broader compatibility across various model architectures, including those not yet registered in `osl_dynamics.models`.

- **Support for Sparse Gradient Data Types:**
  - TensorFlow gradients may come in various data types, including sparse tensors. This PR introduces functionality to convert sparse gradients into dense tensors for logging purposes.
  - Users have the option to preserve or discard zero values within sparse gradients.
  - Summary statistics, such as the ratio of non-zero values, are provided for enhanced interpretability.

- **Merging Multiple Event Files:**
  - Large models that exceed memory or computational constraints often require training one epoch at a time, resulting in separate TensorBoard event files per epoch. The callbacks now support seamless merging of multiple event files, ensuring continuous and coherent logging of weights and gradient distributions across epochs.

### Developer Notes:

- Currently, logging does not support ragged tensors. This feature can be added in future updates if required.
- The callbacks are optimised specifically for epoch-level logging. Batch-level logging will require further modifications if necessary.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80b91680203c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.