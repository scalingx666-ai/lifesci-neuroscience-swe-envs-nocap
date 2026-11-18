# Issue

**Title:** Rescale normalized variance explained to 0 - 100

## Description

.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Remove `calculate_varex_norm` and just use `calculate_varex` for both normalized and unnormalized variance explained.
- Multiply PCA-estimated variance explained by 100.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `674abd8d75bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.