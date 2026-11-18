# Issue

**Title:** Enhancement related to TFRecords

## Description

This PR allows TFRecords/`tf.data.Dataset` to be passed as inputs to several methods including:

- `model.set_regularizers`
- `obs_mod.set_dev_parameters_initializer`
- `hmm.Model.dual_estimation`
- `dynemo.Model.dual_estimation`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff7154d40c44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.