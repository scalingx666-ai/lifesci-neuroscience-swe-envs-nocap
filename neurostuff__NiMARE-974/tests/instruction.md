# Issue

**Title:** Refactor/studyset native core

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
 My attempt to get studysets to be the main entity for passing to estimators on nimare

## Summary by Sourcery

Enable Studyset-native execution across estimators and workflows while preserving Dataset compatibility and richer NIMADS metadata.

New Features:
- Add StudysetView to provide a Dataset-like, cached tabular view over NIMADS Studysets for use by estimators and workflows.
- Allow core estimators, CBMA/IBMA workflows, and transforms to accept Studyset inputs transparently via StudysetView.
- Extend NIMADS conversions to carry images, annotations, and texts between Studyset and Dataset representations.

Enhancements:
- Improve Studyset construction and serialization with schema validation, execution-context caching (space, masker, tables), and support for annotations/texts.
- Enrich metadata handling in NIMADS conversion by merging study and analysis metadata while normalizing image types and coordinate spaces.
- Optimize Studyset utilities with iteration helpers, cache invalidation (touch), and reuse of Dataset tables without unnecessary rebuilding.
- Add Studyset-based code paths to CBMA benchmarks to compare Dataset vs Studyset performance.

Tests:
- Add parity and smoke tests to verify that ALE, IBMA, CBMA workflows, CBMR, and reports produce consistent results when run on Studysets versus Datasets.
- Add round-trip tests to ensure Dataset→Studyset→Dataset conversions preserve images, metadata, annotations, and texts, as well as cached execution context.
- Test StudysetView behavior around caching, mutation, deepcopy semantics, and rebuilding after Studyset updates.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac2adfba588a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.