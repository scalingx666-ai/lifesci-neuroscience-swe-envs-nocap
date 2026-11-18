# Issue

**Title:** [REF/ENH] Optimize Jackknife cluster summaries by reusing array-space cluster context

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

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Optimize jackknife cluster contribution diagnostics by reusing precomputed cluster context and standardizing target map selection.

Enhancements:
- Introduce reusable cluster summary context that supports both voxelwise masked-array and image-based aggregation to avoid redundant masking work.
- Standardize selection of the statistic map used for per-cluster calculations via a dedicated helper that enforces a deterministic priority and explicit error handling.

Tests:
- Add unit tests covering cluster summarization behavior in both masked-array and image modes, and for deterministic and failure cases in target value map selection.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b060ec2aab55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.