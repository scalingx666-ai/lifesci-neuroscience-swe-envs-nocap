# Issue

**Title:** [FIX] studyset regressions

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

- normalize sample_size in studyset
- don't drop extra data in studyset
- optimize loading of studyset.

## Summary by Sourcery

Normalize Studyset metadata and coordinate handling for NIMADS conversions and merging.

Bug Fixes:
- Preserve per-coordinate values, metadata, and image-relative paths when converting between Dataset and NIMADS Studyset representations.
- Normalize and coerce sample size fields from various metadata locations into a consistent numeric list form, including handling of string-valued and singular entries.
- Ensure Studyset merge operations retain the left-hand execution context (target space, masker, and coordinate harmonization policy).
- Normalize literal "None" string values in Studyset tabular views to proper missing values to match Dataset behavior.
- Handle missing coordinates safely when instantiating NIMADS Point objects.

Enhancements:
- Optimize Dataset-to-NIMADS Studyset conversions by caching first rows by id and seeding projected table caches more efficiently.
- Expose richer point relationships (kind, label_id, image, values) through NIMADS Point objects and coordinate tables.
- Support round-tripping of coordinate-side statistical values and metadata between Dataset and Studyset via structured point values and reserved metadata keys.

Tests:
- Add regression tests to verify preservation of coordinate-side values and metadata, execution context on merge, sample size coercion, and normalization of "None" strings in Studyset views.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1767dd3652fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.