# Issue

**Title:** Feat: Repeat dataset when steps_per_epoch is passed to model.fit().

## Description

Added feature to repeat datasets.

This allows the users to pass `steps_per_epoch` to `model.fit()`, which is useful for early stopping with the `tf.keras.callbacks.ModelCheckpoint` callback.

This PR also prevents shuffling and repeating the validation dataset, which is the preferred behaviour when `validation_steps` is passed to `model.fit()` so that the same validation set is used for different epochs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `347a742b16e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.