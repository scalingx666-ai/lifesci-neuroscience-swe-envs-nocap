# Issue

**Title:** docs: state the units returned by paradigm.get_data

## Description

Review the docstring for `BaseProcessing.get_data` in `moabb/paradigms/base.py`.

The code multiplies the array from `Epochs.get_data()` by `dataset.unit_factor` (default `1e6`) in `_get_array_pipeline`. The docstring did not say the default array is in microvolts, or that `return_epochs=True` and `return_raws=True` stay in volts. A reader comparing the two return types can be off by 1e6.

1. Read the Returns section for `X`.
2. Check it against the scaling step in `_get_array_pipeline`.

No code changes. No tests run; this changes only docstring text.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `21f54b693c40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.