# Issue

**Title:** ensure cluster label files are named correctly

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
 .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Ensure diagnostic label maps and contribution tables use correct positive/negative tail naming and study IDs across CBMA and pairwise estimators.

Bug Fixes:
- Correct label map naming when only a single negative- or positive-tail cluster map is returned.
- Fix mapping of tails to study ID groups for pairwise estimators so negative tails use the second group as appropriate.
- Align contribution table tail names with the actual tail signs used in diagnostics.

Tests:
- Add regression tests for single-tail negative cluster label map naming.
- Add regression tests verifying pairwise negative-tail diagnostics use group2 study identifiers.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `143da4bd122f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.