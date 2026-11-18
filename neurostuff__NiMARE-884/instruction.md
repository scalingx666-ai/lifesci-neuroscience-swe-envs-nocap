# Issue

**Title:** Add support for the `concordant` mode test in Fisher's and Stouffer's estimators

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
Closes None.

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Currently, we only support `directed` tests in Fisher's and Stouffer's estimators. The new parameter `two_sided` (following Nilearn's naming convention) adds support for the `concordant` (two-sided) test.
- That parameter will be used in the Diagnostics module to determine if the diagnostic should be run for z < 0.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80cc7a58b5be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.