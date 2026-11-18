# Issue

**Title:** [dependency] Remove unnecessary dependency

## Description

This pull request includes changes to the installation instructions and dependencies for the `brainpy` package, specifically removing support for CUDA 11 and updating the documentation accordingly.

Updates to installation instructions and dependencies:

* [`docs/index.rst`](diffhunk://#diff-8d068e8797e88947c320f79e856c3e16a72b730124a8f9d7031e2c4680dfa534L23-R23): Removed the installation instructions for GPU with CUDA 11 and updated the tab label for CUDA 12.
* [`setup.py`](diffhunk://#diff-60f61ab7a8d1910d86d9fda2261620314edcae5894d5aaa236b821c7256badd7L71-L76): Removed the dependencies for CUDA 11 and adjusted the extras_require section to reflect this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `589a27cf196d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.