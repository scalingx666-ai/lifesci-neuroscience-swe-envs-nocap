# Issue

**Title:** RF: Remove much of the hardcoded `T1w` fields in favor of `anat`

## Description

This is a supplemental PR to  - since nibabies also relies on smriprep, but may be processing in T2w space, this PR generalize many of the workflows/nodes/fields to account for other anatomical references.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7852cbaceccc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.