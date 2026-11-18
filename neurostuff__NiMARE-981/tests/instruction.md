# Issue

**Title:** update documentation to state valid combinations of parameters

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


<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- add documentation on valid combinations of parameters
-

## Summary by Sourcery

Document valid Neurosynth parameter combinations and recommended defaults for term-based workflows.

Enhancements:
- Expand fetch_neurosynth docstring and dataset example with guidance on selecting appropriate Neurosynth annotations instead of downloading all feature files.

Documentation:
- Clarify the meaning and valid combinations of the Neurosynth fetch_neurosynth selector parameters (source, vocab, type) across database versions.
- Recommend abstract-derived term annotations as the default choice for most Neurosynth term-based and decoding workflows.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b905da2c19a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.