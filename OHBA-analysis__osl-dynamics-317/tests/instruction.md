# Issue

**Title:** Fix: Use same random initialisation methods

## Description

Currently, when building TensorFlow datasets for random initialisations or model fitting, we inconsistently handle the last data batch:

- For HMM initialisation/training and DyNeMo training, we set `drop_last_batch=False`.
- However, for DyNeMo initialisation (and more generally initialisations of `VariationalInferenceModel` or `MarkovStateInferenceModel`), we set `drop_last_batch=True`.

This pull request unifies the handling by setting `drop_last_batch=False` for all random initialisation methods. This ensures consistency across all model initialisation strategies.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b297579bdfc0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.