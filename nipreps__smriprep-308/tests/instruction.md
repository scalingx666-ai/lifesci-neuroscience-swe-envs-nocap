# Issue

**Title:** CI: Set max Python version to 3.10

## Description

Until scikit-image, h5py and pytables have 3.11 wheels on PyPI, it's not worth testing it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `791d31328af3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.