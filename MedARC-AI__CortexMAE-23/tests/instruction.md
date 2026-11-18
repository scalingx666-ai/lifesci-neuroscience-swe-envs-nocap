# Issue

**Title:** Add wrapper module to integrate with external eval suite

## Description

This adds a model wrapper to integrate with the external eval suite [`fmri-fm-eval`](https://github.com/MedARC-AI/fmri-fm-eval).

Verified that tests pass with
```
uv run python -m fmri_fm_eval.models.test_models flat_mae_base_patch16_16
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a2c3c6cf899`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.