# Issue

**Title:** Bump pymare version in setup.cfg

## Description

Update pymare version requirement from 0.0.12 to 0.0.13.

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
- bump to 0.0.13 (not impacting any algorithms today, but this version is substantially more correct than 0.0.12

## Summary by Sourcery

Enhancements:
- Require PyMARE 0.0.13 for general and minimum supported installations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78426eb17ae6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.