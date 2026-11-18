# Issue

**Title:** [FIX] warn unsigned p to z

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

Preserve available sign information during p-to-z conversion and clearly warn when converted z maps are unsigned.

Bug Fixes:
- Preserve the direction of z maps converted from p maps when a corresponding t map is available, even without sample-size information.
- Warn when converting p maps without directional information would produce unsigned z values, including the affected analysis identifier.

Documentation:
- Document the behavior and limitations of p-to-z conversions when directional information is unavailable.

Tests:
- Add coverage for signed and unsigned p-to-z conversions and analysis-specific warnings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdb11f05fa10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.