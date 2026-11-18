# Issue

**Title:** Fix DDP hang in voxel2clip, support using test set as validation, and add mixco+image aug to e2e

## Description

- Fix a bug where voxel2clip hangs inside mixco loss when using DDP during validation (set `distributed=False` there)
- Support running with the test set as the validation set and the train + val sets as the training set (`test_is_val` kwarg for `utils.get_dataloaders`.)
- Add mixco and image augmentation to the e2e training script

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `575a46b2cb41`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.