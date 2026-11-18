# Issue

**Title:** Numba workflow patch

## Description

Fixes the numba workflow on main prior to publishing our first release.

The old numba workflow was running the test suite, but was not setting up headless displays etc. This was not caught previously, since `cellfinder-core` did not need any special napari treatment to run the tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3a76a6e624b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.