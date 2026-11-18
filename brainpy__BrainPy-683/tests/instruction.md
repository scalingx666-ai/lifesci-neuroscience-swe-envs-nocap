# Issue

**Title:** [bug] Fix prograss bar is not displayed and updated as expected

## Description

`jax.pure_callback()` may not work as expected for certain use cases, such as updating a progress bar, whereas `jax.debug.callback()`can be used effectively.

`jax.pure_callback()` is intended for pure functions without side effects. If JAX determines that the callback's result isn't used in the computation, it might optimize the callback call out, which means updates to a progress bar (a side effect) wouldn't occur.

`jax.debug.callback()`, on the other hand, does not assume the function is pure and always executes the callback as part of the computation. This consistency ensures that progress bar updates and other side effects happen reliably, even under JAX transformations like jit and vmap.

For more detail, see https://jax.readthedocs.io/en/latest/notebooks/external_callbacks.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e75f78ad27a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.