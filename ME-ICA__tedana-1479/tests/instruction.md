# Issue

**Title:** Add PCA tab to HTML report

## Description

. We could expand this in the future to include component maps (e.g., if verbose is True) and other PCA-related figures.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Create new PCA tab in HTML report for the already-generated PCA-related figures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1b00bcd1067`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.