# Issue

**Title:** Add nnU-Net preprocessing pipeline and CLI switch

## Description

## Summary
- add typed nnU-Net preprocessing config (`nnunet_preprocessing`) across training/test/tune data configs
- introduce `NNUNetPreprocessd` transform to perform foreground cropping, spacing-aware resampling, and nnU-Net-style normalization with reversible metadata
- integrate preprocessing into train/val/test/tune transform builders and avoid duplicate intensity normalization when enabled
- restore decoded predictions back to input space before writing outputs when configured
- add CLI switch `--nnunet-preprocess` to enable preprocessing quickly for a run
- add tutorial config example and unit tests for preprocessing + CLI behavior

## Validation
- `pytest -q tests/unit/test_main_cli_contract.py`
- `pytest -q tests/unit/test_lit_utils.py`
- `pytest -q tests/unit/test_nnunet_preprocessing.py`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a9d708f1952`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.