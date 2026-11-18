# Issue

**Title:** Create ml scaffold and add shared fixtures

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
 #1012 #1013 #1014 #1015  .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- Created machine-learning scaffold. 
- Added shared Dataset/Studyset fixture.

## Summary by Sourcery

Introduce a scaffolded machine-learning API for masked activation workflows and add shared dataset/studyset fixtures to support testing.

New Features:
- Add a new nimare.ml module exposing placeholder MAFeatureDataset, MAFeatureExtractor, and make_map_reducer interfaces for future masked activation workflows.
- Provide executable example scripts documenting the planned masked activation feature dataset and feature reduction workflows while only relying on the public API imports.

Documentation:
- Add gallery examples that document the public API for upcoming masked activation feature dataset and reduction workflows without requiring full implementations.

Tests:
- Add shared Dataset/Studyset builders and tests validating their structure and ambiguous short-ID handling for use in machine-learning workflows.
- Add tests asserting that the current MAFeatureDataset, MAFeatureExtractor, and make_map_reducer stubs raise NotImplementedError as placeholders.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64fc6405f6c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.