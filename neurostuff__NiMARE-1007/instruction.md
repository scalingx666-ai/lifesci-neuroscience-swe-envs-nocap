# Issue

**Title:** [ENH] make loading large studysets faster

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

Optimize studyset loading, analysis combination, and result copying to reduce memory usage and speed up operations on large datasets.

Enhancements:
- Speed up annotation handling and avoid unnecessary deep copies when loading or slicing studysets, including structural copying only when needed.
- Rework coordinate table construction to use column-wise accumulation and sparse extras for faster, lower-overhead DataFrame creation on large point sets.
- Refactor Studyset.combine_analyses to operate on the raw source dict and rebuild via StudysetStore for more efficient merging of analyses and annotation handling.
- Optimize MetaResult.copy to reuse immutable estimator/corrector state and avoid repeated description parsing while still deep-copying maps and tables.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f03b76290705`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.