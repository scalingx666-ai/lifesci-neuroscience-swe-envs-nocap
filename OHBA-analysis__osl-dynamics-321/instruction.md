# Issue

**Title:** Add: Callbacks for logging and monitoring in TensorBoard

## Description

### Summary
This pull request introduces the following enhancements:

1. **`TensorBoardCallback`**: Adds a callback for comprehensive logging and visualisation of weights and biases in TensorBoard, facilitating easier monitoring and debugging of model training.

2. **Improved `tf.Variable` Naming**: Assigns descriptive names to `tf.Variable` instances, enabling clearer and more precise logging outputs overall.

3. **`GradientMonitoringCallback`**: Adds a callback for logging and monitoring the gradient updates of every layers in TensorBoard. Optionally, the user can also print the summary statistics of the gradients.

The callbacks here are primarily intended for debugging purposes and for inspecting model behaviour during training.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `27b855655194`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.