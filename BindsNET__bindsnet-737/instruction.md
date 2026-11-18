# Issue

**Title:** Improve assign_labels accuracy and performance

## Description

Resolved a bug where silent neurons defaulted to the first class label. Optimized indexing to prevent unnecessary host-to-device transfers and added robust NaN handling for firing rate proportions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `154b84d9721d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.