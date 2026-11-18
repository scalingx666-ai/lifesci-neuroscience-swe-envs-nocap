# Issue

**Title:** Add verbose option to ica_reclassify to obtain denoised echo images

## Description

<!---
This is a suggested pull request template for tedana.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/ME-ICA/tedana/blob/main/CONTRIBUTING.md#pull-requests
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

- Adds verbose option to `ica_reclassify`
- Changes the way input files are registered from relative paths to absolute paths
- Adds `verbose = True` to the four echo integration test

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `894eb7719c04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.