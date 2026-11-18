# Issue

**Title:** Validation Split

## Description

Closes 

Changes:
- Updated implementation of validation split in the Data object.

Note:
- We no longer need `keras.utils.split_dataset`, which means we are compatible with TensorFlow <2.11.
- If `Data.tfrecord_dataset` is called multiple times and we rewrite the TFRecord files, we will get a new random split for each session each time.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9191f752544`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.