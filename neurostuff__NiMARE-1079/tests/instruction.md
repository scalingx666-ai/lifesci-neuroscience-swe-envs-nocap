# Issue

**Title:** first pass at loading parquet files for meta-analysis

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

This will help neurostore distribute a downloadable file that contains all the public studies in the database, and creates a smooth loading process directly into a Studyset.
<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Add support for converting NeuroStore/NIMADS JSON exports into NiMARE parquet-backed studysets and loading them directly from a parquet directory.

New Features:
- Introduce conversion utilities to transform NeuroStore studyset and annotation JSON files into a set of canonical NiMARE parquet tables plus metadata.
- Allow Studyset to be instantiated from a directory of parquet studyset tables, reconstructing a minimal NIMADS-like source on demand.

Enhancements:
- Refine Studyset.from_table_cache execution profile and projection cache seeding to consistently use projected tables from the StudysetStore.
- Improve robustness of Studyset construction by handling cases where some canonical tables are missing or empty when rebuilding NIMADS-like sources.

Build:
- Add an optional parquet extra that installs pyarrow and include pyarrow in the tests extra and the all meta-extra.

Tests:
- Add round-trip tests that convert NeuroStore JSON plus annotations to parquet and load them back into a Studyset, validating coordinates, metadata, and annotations.
- Add regression tests that ensure explicit errors are raised when required study or analysis IDs are missing during conversion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `39714fec285b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.