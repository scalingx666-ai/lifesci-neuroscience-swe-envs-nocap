# Issue

**Title:** Fix single image generation bug

## Description

I removed `np.squeeze`, which led to the in silico EEG responses to not be in the correct shape `['batch_size', 'n_repetitions', 'n_channels', 'n_timepoints']`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6c9278637559`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.