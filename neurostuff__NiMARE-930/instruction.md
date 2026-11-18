# Issue

**Title:** [FIX] do not try to set n_cores on initialized objects

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
Closes # Feedback I received from a confused user in person

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

- only inialize with arguments if objects have not already been initialized

## Summary by Sourcery

Prevent passing n_cores to already instantiated workflow components by applying parallelism settings only when creating new objects and clarify instantiation logic for estimators, correctors, and diagnostics.

Bug Fixes:
- Only apply n_cores keyword in _check_input when the component is a class or string to avoid resetting initialized objects.
- Correct diagnostic n_cores injection in Workflow._preprocess_input to only add parallelism parameter when instantiating diagnostics.

Enhancements:
- Refactor estimator and corrector initialization in Workflow._preprocess_input for clearer separation between default construction and input checking.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db35391980d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.