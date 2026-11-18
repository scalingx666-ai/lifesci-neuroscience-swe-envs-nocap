# Issue

**Title:** [ENH] Add montecarlo mcc to ALESubtraction

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

Add Monte Carlo-based voxel- and optional cluster-level null distributions to ALESubtraction and validate them with new tests.

New Features:
- Expose voxel-level Monte Carlo null distribution summaries from ALESubtraction for voxel-wise FWE correction.
- Optionally compute and store cluster size and mass Monte Carlo null distributions in ALESubtraction, configurable via new parameters.

Enhancements:
- Extend ALESubtraction with configuration options for voxel thresholding and toggling cluster null computation.
- Retain summarized null distribution statistics within ALESubtraction instead of discarding all voxel-wise null data.

Tests:
- Add tests to confirm voxel-level Monte Carlo null distributions are generated and stored by ALESubtraction.
- Add tests to verify optional cluster size and mass null distributions are produced when enabled.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c09c8cdb1ed8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.