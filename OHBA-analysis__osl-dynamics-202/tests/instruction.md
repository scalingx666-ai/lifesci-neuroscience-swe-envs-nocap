# Issue

**Title:** Multiple GPU training and prepare for newer TF versions

## Description

Changes
- Use of TFRecords no longer trigger error in later TF versions.
- Fixed different bugs related to using TFRecords and multiple GPUs.
- Disallow inference on multiple GPUs.
- Allow loading a model while forcing it to be compiled on a single GPU.
- Warning when using multiple GPUs but not using TFRecords.

This closes the issues #185 and #176 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa781468fa19`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.