# Issue

**Title:** Fix neuron, training, and ODE bugs and tighten dependencies

## Description

## Summary by Sourcery

Improve error handling, state updates, numerical methods, and dependency configuration across neuron dynamics, training, math utilities, and build metadata.

Bug Fixes:
- Provide descriptive ValueError messages for invalid spike reset modes in LIF neuron updates.
- Handle zero and negative slice steps correctly when converting slices to counts in dynamical systems.
- Raise the correct NoLongerSupportError when an unsupported seed is provided in back propagation training.
- Compute scalar metrics using NumPy means instead of JAX conversions in training loops to avoid backend issues.
- Update synapse state variables by writing to underlying .value attributes instead of relying on in-place ops on wrappers.
- Fix NodeDict and VarDict update logic when given (key, value) tuples and improve duplicate-key error messages to reference existing objects.
- Correct batch dimension slicing logic in variable size_without_batch to use the configured batch axis.
- Ensure load_state reports missing nodes when keys are absent from the provided state dict.
- Narrow overly broad exception handlers in convolution layers and Flax interoperation to specific import/shape errors.
- Correct Bogacki–Shampine integrator coefficients and default ODE method assignment in ODE integrator configuration.
- Fix Array.value setter to use the stored value directly instead of invoking tracer checks that can break assignment.

Enhancements:
- Tighten Python version and library dependency requirements in pyproject and requirements to reflect supported environments and minimum versions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64e31f2c4f9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.