# Issue

**Title:** [CI] add windows

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

Expand and standardize continuous integration testing across platforms and test suites.

CI:
- Add Windows runners to the main test matrix in the GitHub Actions workflow.
- Standardize package installation in CI by using `python -m pip` across all jobs.
- Replace make-based test invocations in CI with explicit pytest commands and markers for different test groups.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `013ba3df09b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.