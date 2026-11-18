# Issue

**Title:** [ENH] add a low memory condition for ALESubtraction

## Description

<!---
This is a suggested pull request template for NiMARE.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/neurostuff/NiMARE/blob/main/CONTRIBUTING.md#pull-requests
-->

<!-- Please indicate after the # which issue you're closing with this PR.
This is helpful for the maintainers AND will magically close the issue when this
pull request is merged!
https://help.github.com/articles/closing-issues-using-keywords -->
Closes # .
The other major blockage in the AWS cloud storage logs is trying to run a large reference studyset (like neurostore) with ALEsubtraction. This pull request lowers the memory cost for running this algorithm, and hopefully helps in some low memory environments.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Introduce a low-memory execution path for ALESubtraction and refactor permutation handling to support disk-backed, chunked MA maps while preserving existing statistical behavior.

Enhancements:
- Add an optional low_memory mode to ALESubtraction that can chunk MA-map generation and store CSR data on disk-backed memmaps based on available RAM.
- Refactor ALESubtraction permutation and null-distribution computation to use a shared pairwise MA-map store and reusable helpers for permutations and cluster nulls.
- Implement utilities to estimate CSR memory usage, determine chunk sizes from system memory, and safely manage temporary memmap files for sparse data.

Tests:
- Extend ALESubtraction tests to cover low_memory parameter validation, equivalence between partitioned and combined summary statistics, consistency between low-memory and standard results, and activation of low-memory behavior under constrained RAM conditions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `af93a5f9cecc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.