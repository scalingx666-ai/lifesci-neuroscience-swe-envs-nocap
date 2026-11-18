# Issue

**Title:** Enforce latest version of scikit-image

## Description

Required to address issue with dask: https://forum.image.sc/t/brain-registration-issue/97850

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6a22e512022`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.