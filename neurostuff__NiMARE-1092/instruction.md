# Issue

**Title:** [ENH] Add d, g and g_var targets to ImageTransformer

## Description

Standardized effect sizes were reachable only inside FixedEffectsHedges, which derives them internally and is fixed-effect only. Exposing them as transform targets makes the pair a meta-regression takes -- g in the effect slot, g_var in the variance slot -- available to any estimator, which matters when studies report betas in pipeline-specific units that no varcope can reconcile.

All three resolve from t and the sample size, and t already resolves from z, so a studyset holding nothing but z maps can reach them. The conversion is the one-sample d = t / sqrt(N); more than one group sample size now warns, since a between-group contrast needs both sizes separately.

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

Expose standardized effect sizes and their variance as image transformation targets for broader meta-analysis workflows.

New Features:
- Add ImageTransformer and transform_images support for Cohen’s d, Hedges’ g, and the sampling variance of g.
- Enable standardized effect-size targets to be derived from t or z maps and study sample sizes for use in meta-regression.

Enhancements:
- Warn when standardized effect sizes are derived from multiple group sample sizes using the one-sample conversion.

Documentation:
- Document the new standardized effect-size transformation targets and their intended use.

Tests:
- Add coverage for direct d, g, and g_var conversions, z-to-g resolution, missing sample sizes, and multiple-group warnings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `605e03fb4858`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.