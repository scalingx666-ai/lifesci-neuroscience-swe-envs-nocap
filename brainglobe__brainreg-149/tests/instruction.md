# Issue

**Title:** Update with brainreg-segment rename to brainglobe-segmentation

## Description

Updates the `brainreg-segment` dependency to be consistent with 

NOTE: CI will fail until the aforementioned PR is merged and a new PyPI version is published.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8ba83c81a14`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.