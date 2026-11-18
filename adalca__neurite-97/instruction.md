# Issue

**Title:** Add Default Backend Change Warning for PyTorch Transition

## Description

Added a future warning for the transition from TensorFlow to PyTorch.

* **Reason**: To streamline development and maintenance efforts by focusing mostly on the PyTorch backend.
* **Impact**: Users who have not explicitly set a backend (in the environment variable `NEURITE_BACKEND`) will receive a warning upon importing neurite, encouraging them to consider using 'tensorflow' as the `NEURITE_BACKEND`, or migrating to PyTorch for continued support and updates.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ae2f5cec220`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.