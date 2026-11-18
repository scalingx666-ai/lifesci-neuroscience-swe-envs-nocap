# Issue

**Title:** [FIX] be more permissive with sample size

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
  .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Make sample size handling in convert_nimads_to_dataset more permissive by logging warnings and attempting to coerce non-list or non-numeric sample size values into numeric lists rather than raising exceptions

Enhancements:
- Log warnings and coerce invalid sample_sizes to numeric lists instead of raising errors
- Fall back to sample_size metadata when sample_sizes is missing and attempt to convert to numeric

Tests:
- Add parameterized tests for convert_nimads_to_dataset with various annotation and sample size variants
- Add test to confirm warnings are logged for invalid sample_sizes types

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14eb07838ed3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.