# Issue

**Title:** Fix: Prevent in-place operation when rescaling PSD

## Description

The current `rescale_regression_coefs()` function rescales PSD in-place. This commit prevents in-place operation and outputs rescaled PSD as a separate variable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82f274068838`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.