# Issue

**Title:** Add option to overwrite file (and write out extra files with "verbose") in T2smap workflow

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
Closes [I don't know if there was an issue open for this].

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- T2smap workflow currently does not allow to overwrite files - but stops with runtime error if a file would be overwritten, asking to use the non-existing `--overwrite` argument. This PR solves that issue.
- I saw that in the tedana workflow parser, "overwrite" was added to the parser itself rather than to the "optional" parser group, so just quickly changed that, if desirable.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f84cbbc185e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.