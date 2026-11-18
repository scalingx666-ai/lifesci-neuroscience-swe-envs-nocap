# Issue

**Title:** ENH: allow conversions between NIMADS <--> SLEUTH

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



Provide bidirectional conversion between NIMADS Studyset JSON structures and Sleuth text files with schema validation, annotation‐based splitting, spatial normalization, affine transformations, and enhanced error handling; add corresponding conversion functions and thorough unit tests.

New Features:
- Implement convert_nimads_to_sleuth for exporting NIMADS Studysets to Sleuth files with annotation splitting, affine transforms, decimal precision, and target space normalization
- Add convert_dataset_to_nimads and convert_sleuth_to_nimads to generate NIMADS Studyset dictionaries from NiMARE Datasets and Sleuth text
- Introduce JSON Schema validation for NIMADS Studyset dictionaries

Enhancements:
- Integrate runtime argument validation via Pydantic
- Define new exceptions InvalidStudysetError and ConversionWarning for clear error and warning reporting
- Tidy docstrings and metadata comment generation utilities

Tests:
- Add comprehensive tests covering annotation splitting and filtering, coordinate precision, spatial normalization, affine transformations, idempotency, round‐trip equivalence, empty and malformed inputs, and pathlib/string path support

## Summary by Sourcery

Enable robust, bidirectional conversions between NIMADS Studyset JSON structures and Sleuth text files by introducing new conversion functions, custom exceptions, shared utility routines, and thorough unit tests

New Features:
- Add convert_nimads_to_sleuth for exporting NIMADS Studysets to Sleuth text files with optional annotation splitting, metadata export, target-space normalization, and coordinate precision control
- Implement convert_dataset_to_nimads_dict, convert_dataset_to_studyset, convert_sleuth_to_nimads_dict, and Studyset.from_dataset/from_sleuth for bidirectional conversion between NiMARE Datasets, Sleuth files, and NIMADS Studysets

Enhancements:
- Introduce InvalidStudysetError and ConversionWarning for clear error and warning reporting during conversion
- Centralize file‐writing logic in _write_analysis and improve study/analysis attribute handling and metadata comment generation
- Normalize target‐space inputs and apply mni2tal/tal2mni affine transformations when exporting coordinates

Tests:
- Add comprehensive unit tests covering annotation splitting and filtering, decimal precision, spatial normalization, affine transforms, idempotency and round‐trip equivalence, malformed input errors, and both pathlib and string path support

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88c29761f394`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.