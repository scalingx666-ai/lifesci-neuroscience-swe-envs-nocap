# Issue

**Title:** [FIX] fix the compilation of the description on pypi

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

Fixes the compilation of the description on PyPI by moving the long description to a separate markdown file and updating the setup.cfg file to point to it.

Build:
- Moves the long description to a separate markdown file.
- Updates the setup.cfg file to point to the new markdown file for the long description.
- Changes the long description content type to markdown.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e36e4aa76e3a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.