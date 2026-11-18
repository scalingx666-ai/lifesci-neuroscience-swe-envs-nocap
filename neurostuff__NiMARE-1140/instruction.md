# Issue

**Title:** [FIX] ensure traversing slices of a studyset maintains the view

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

- keep the filtered view when accessing child/parent objects. (Studysets can be different views of the same store; the storage is immutable, and the studysets are immutable as well, but multiple studysets can reference the same store)

## Summary by Sourcery

Keep Studyset selections intact across nested traversal and all supported export paths.

Bug Fixes:
- Preserve analysis and focus selections when traversing nested Studyset accessors, including parent and child relationships.
- Ensure coordinates, image references, and exported representations remain consistent with the active Studyset view.

Enhancements:
- Propagate view context through nested accessors and validate point-selection masks against the full store.
- Optimize nested selection lookups and parent-study discovery for filtered views.

Documentation:
- Clarify that nested accessors remain confined to the originating Studyset view and document point-mask alignment.

Tests:
- Add coverage for filtered nested traversal, view-specific coordinate spaces, resolved image references, exports, and Sleuth conversion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01f312dd385e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.