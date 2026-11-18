# Issue

**Title:** [dyn] add `clear_input` in the `step_run` function.

## Description

Usually, we use `step_run` with `brainpy.math.for_loop`. This function does not call `brainpy.clear_input`, which may cause problems of input accumulation when using old APIs in ``brainpy.neurons`` module. Therefore, we should call ``brainpy.clear_input`` after each ``update`` function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc5aa7231cae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.