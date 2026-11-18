# Issue

**Title:** Add public API skeletons and export ml module

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
 #1017 (T006 T007 T008 T009).

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Add public API skeletons
- Export nimare/ml module
- Add shared assertions and internel helper placeholders

## Summary by Sourcery

Introduce initial public machine learning API scaffolding and export the ml module at the package level.

New Features:
- Add MAFeatureDataset container class for aligned map features, metadata, targets, and provenance.
- Add MAFeatureExtractor interface for converting NiMARE study collections into MAFeatureDataset objects.
- Add make_map_reducer factory function for constructing map-feature reduction workflows.

Enhancements:
- Export the ml submodule from the top-level nimare package namespace.

Tests:
- Add unit tests covering MAFeatureDataset initialization, validation, and placeholder methods.
- Add unit tests covering MAFeatureExtractor initialization and placeholder methods.
- Update tests for make_map_reducer to use a named reduction method argument.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `347f14192c7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.