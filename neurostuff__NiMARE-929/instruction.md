# Issue

**Title:** [FIX] reduce memory/time for running reports

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

Enable control over interactive brain plot resolution and reduce memory usage by adding a quality parameter, implementing resolution mapping and resource cleanup, and updating report calls to default to low quality.

New Features:
- Add `quality` parameter to `plot_interactive_brain` for adjustable template resolution (low/medium/high)

Enhancements:
- Map quality levels to 3mm/2mm/1mm MNI templates with default low resolution for memory efficiency
- Wrap interactive brain view rendering in a try/finally block to delete `html_view` and free resources
- Update report generator to pass `quality="low"` by default when plotting interactive brains

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0d38f6753997`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.