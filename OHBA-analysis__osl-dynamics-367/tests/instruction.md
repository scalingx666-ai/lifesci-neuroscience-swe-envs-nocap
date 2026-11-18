# Issue

**Title:** Dataset enhancement

## Description

Improved the way we construct datasets
- Removed repeat argument
- always repeat the dataset infinitely before fitting the model
- calculate number of steps per epoch before calling `model.fit()`

This is the recommended way to construct datasets in Tensorflow.
This removes warnings regarding not enough data in the datasets and potential pitfalls in constructing dataset.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd02adcd4adf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.