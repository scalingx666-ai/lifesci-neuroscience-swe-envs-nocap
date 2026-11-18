# Issue

**Title:** Validate model inputs before running detection

## Description

If classification is enabled but the model or weights path is wrong,
cellfinder runs the entire detection before hitting the error. This
moves the validation to happen first so it fails fast.

Addresses #337

`prep_model_weights` now runs before detection starts. Also added a
check in `prep_models` for when a user passes a custom weights path
that doesn't exist.

Run `python -m pytest tests/core/test_unit/test_main.py -v`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `378560aa2239`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.