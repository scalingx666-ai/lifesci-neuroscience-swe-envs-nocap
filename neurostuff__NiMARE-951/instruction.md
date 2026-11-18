# Issue

**Title:** [FIX] sample size handling

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

Improve handling and validation of sample size information from annotations and metadata, and enforce clearer errors when required sample sizes are missing for ALE-based analyses.

Bug Fixes:
- Ensure sample size values from annotations and metadata are robustly coerced to numeric lists with sensible fallbacks when values are invalid or incorrectly typed.
- Prioritize sample size fields from annotations over analysis and study metadata when constructing dataset metadata.

Enhancements:
- Add explicit validation that ALE kernels requiring per-experiment sample sizes fail with an informative error when sample sizes are missing, including listing affected experiment ids.

Tests:
- Expand IO tests to cover sample size precedence between annotations and metadata and fallback behavior on invalid annotation values.
- Add ALE meta-analysis test verifying the informative error message when sample sizes are missing for some experiments.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8add1219661`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.