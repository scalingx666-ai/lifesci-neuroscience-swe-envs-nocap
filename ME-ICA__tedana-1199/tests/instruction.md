# Issue

**Title:** Add logging for tedana newsletter subscription information

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


<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Adds a new function to `utils.py` to avoid rewriting the same logs in all 3 workflows.
- Calls the `utils.log_newsletter_info()` at the end of each workflow.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08a822312381`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.