# Issue

**Title:** [ENH] correlation decoder performance

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

Improve CBMA estimators and correlation decoding by enabling reuse of precomputed MA maps, optimizing study-wise kernel accumulation, and making estimator description generation optional.

New Features:
- Allow CBMA estimators and pairwise CBMA estimators to accept and reuse precomputed MA maps in fit calls, including from CorrelationDecoder.
- Enable CorrelationDecoder to precompute and cache MA maps across features when using pairwise CBMA estimators.

Enhancements:
- Optimize KDA MA map computation with a numba-accelerated study-wise accumulation routine that deduplicates voxels per study.
- Centralize and gate estimator description text generation via a generate_description flag and helper, avoiding unnecessary work and parsing.
- Adjust MKDAChi2 chi-square to z-score conversion to use a dedicated chi-square survival function and direct chi-square-to-z transformation.
- Ensure MetaResult description handling is robust to empty descriptions and avoids unnecessary reference extraction when descriptions are disabled.

Tests:
- Add tests verifying that CorrelationDecoder’s MA-map precomputation matches baseline results and is bypassed for single-group CBMA estimators.
- Add tests ensuring ALE and MKDAChi2 correctly ignore precomputed MA maps from previous fits and that precomputed maps do not leak between calls.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cdea6ddd55a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.