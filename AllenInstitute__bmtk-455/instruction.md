# Issue

**Title:** Update dpointnet training approach modes + TF option

## Description

## Summary

This PR updates dpointnet training execution mode names and adds a memory-efficient accumulated-gradient series mode.

### Changes

- Renames `training_approach` values for clearer semantics:
  - `batched` -> `parallel`
  - `inseries` -> `series`
  - `series_accumulate` (new)
- Removes the selectable `sequential` mode, which was not implemented.
- Keeps `single` as the one-parameter path; using `single` with multiple parameter sets still errors.
- Adds `series_accumulate`, which runs parameter sets one at a time, accumulates gradients, then applies one optimizer update.
- Sets `TF_GPU_ALLOCATOR=cuda_malloc_async` by default before TensorFlow is imported.
- Updates tracked dpointnet example config values to the new mode names.

## Why

`batched` was easy to confuse with normal `batch_size`. The new names describe execution semantics:

- `parallel`: concatenate independent parameter streams along the batch axis, fastest but higher memory.
- `series`: run parameter streams separately, lower memory, one optimizer update per parameter.
- `series_accumulate`: run parameter streams separately, lower memory, one optimizer update after accumulated gradients.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac3e56901d72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.