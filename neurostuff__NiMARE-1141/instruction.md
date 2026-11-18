# Issue

**Title:** [ENH] mkda sample size weighting

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
Based on the matlab implementation that already takes into account sample size, and this makes MKDA more directly comparable to ALE.

Closes # .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Enable optional sample-size weighting in MKDA and provide statistically consistent null distributions, configuration APIs, documentation, and regression coverage.

New Features:
- Add opt-in sample-size weighting to MKDA using square-root sample-size scaling, with support for explicit weights and fixed-effects discounts.
- Expose configurable handling of missing weights, transformations, reductions, and weighting metadata through the new StudyWeights API.

Bug Fixes:
- Correct summary-statistic threshold derivation from approximate and Monte Carlo null histograms by using upper-tail accumulation.

Enhancements:
- Implement weighted MKDA null distributions for continuous weighted statistics while preserving exact integer behavior for uniform weights.
- Renormalize weights over analyzed subsets and include weighting details and effective sample size in generated method descriptions.
- Optimize histogram bin lookup and weighted permutation histogram generation.

Documentation:
- Document MKDA sample-size weighting and add an example demonstrating its effects and configuration options.
- Add the supporting Wager et al. weighting reference.

Tests:
- Add comprehensive tests for weighting formulas, metadata handling, normalization, fixed-effects discounts, imputation, weighted null distributions, subset alignment, Monte Carlo behavior, and threshold monotonicity.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1643a57e2eb1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.