# Issue

**Title:** Migrate ebrainsFeature to EbrainsDatasetVersionV3

## Description

EbrainsFeature queries have been using KG v1 connection. This PR makes general adjustments to ebrains data features around EbrainsDatasetVersionV3 queries.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfce6eccb9bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.