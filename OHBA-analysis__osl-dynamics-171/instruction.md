# Issue

**Title:** Refact/dataset

## Description

- `subj_id` is renamed to `array_id` for better consistency.
- `array_id` is always included in the dataset, which solves the bug when training both models that doesn't need `array_id` (e.g. DyNeMo) and models that need `array_id` (e.g. SE-DyNeMo) on the same tfrecord files, which won't be overwritten.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb0e7f80d119`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.