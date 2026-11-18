# Issue

**Title:** Estimate the null correlation per pair of images

## Description

Real NeuroVault maps carry an exact 0 where they have no coverage, so _preprocess_dependence's isfinite test excluded nothing: on all 41 combination-test runs over 14 staging studysets it kept 100% of the mask, and on one of them 20.8% of the values correlated were structural zeros with no voxel valid in every image.

Centering is what makes that bite. Where two images are both uncovered their residuals are both minus the across-image mean, so they track each other perfectly, and the bias follows the coverage pattern rather than the truth. Against synthetic ground truth with a shared signal of twice the noise sd, a true 0 between images sharing a field of view came out at 0.67 and a true 0.5 between images with independent fields of view at 0.10; pairwise deletion recovered every configuration to within 0.07.

Downstream this moves 17 to 8015 surviving voxels per studyset at BH q=0.05, and cuts blocks that cancel outright from 56 to 32 of 3746. Per-bag estimation was measured and rejected: the median bag on a 22-image studyset holds 8 voxels and 11 images, 7.2% of its group blocks hit the correlation floor, and it aborted 88 of 475 fits.

Complete data still goes through pymare.stats.estimate_null_correlation unchanged, so the aggressive-mask path and full-coverage studysets are bit-identical.

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

Estimate coverage-aware null correlations to improve dependence adjustment for incompletely covered image sets.

New Features:
- Estimate null correlations pairwise using only voxels where each image pair has valid coverage.

Bug Fixes:
- Prevent structural zero values representing uncovered regions from biasing dependence estimates and downstream p-values.

Enhancements:
- Preserve the existing PyMARE correlation path for complete data while applying coverage-aware estimates to incomplete datasets.
- Centralize usable-statistic detection for finite, nonzero image values.

Documentation:
- Document pairwise null-correlation estimation for Fisher and Stouffer IBMA methods.

Tests:
- Add coverage for complete-data compatibility, structural-zero handling, and non-overlapping image pairs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2d6151716fd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.