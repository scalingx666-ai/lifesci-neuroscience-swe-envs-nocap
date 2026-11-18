# Issue

**Title:** [ENH] Report an uncorrected p map from PermutedOLS

## Description

Every other IBMA estimator emits a "p" map; PermutedOLS emitted only t, z and dof, so FDRCorrector and Bonferroni raised "requires 'p' maps ... but none were found". FDRCorrector.inspect() advertised them anyway, so the failure came after a green light.

The p-value is parametric, referred to the same t distribution the z map already uses, and on the same tail as the permutation test and the corrected map.

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

Expose uncorrected p-value maps from PermutedOLS so downstream multiple-comparison correction can be applied consistently.

New Features:
- Add an uncorrected p-value map to PermutedOLS results, using the test’s configured one- or two-sided tail.

Bug Fixes:
- Enable FDR and Bonferroni correction workflows for PermutedOLS by providing the p maps they require.

Documentation:
- Document the new PermutedOLS p-value output.

Tests:
- Verify p-map validity, masking behavior, compatibility with FDR correction, and agreement with the z-map across both tails.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `605e03fb4858`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.