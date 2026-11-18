# Issue

**Title:** Condition CBMR on a per-experiment exposure

## Description

Adds ``exposure()`` to the formula grammar, beside ``s()`` and ``sz()``. It multiplies the expected count instead of carrying a coefficient, so every spatial term estimates a distribution over voxels rather than a rate, and a contrast between groups asks where foci fall rather than how many.

``exposure`` rather than ``offset`` because of the scale. R's ``offset()`` takes the linear predictor, which is why it is written ``offset(log(n))``; statsmodels distinguishes the two by name for the same reason. CBMR takes the count itself and carries it multiplicatively, which is what makes an experiment with no foci inside the mask representable -- it contributes 0 to the pattern total and drops out, rather than producing ``log(0)`` to be managed. ``offset`` is left unclaimed, and a formula using it says which one is meant.

``exposure()`` with no argument is the response's own in-mask totals, supplied by the estimator as the generated column ``_cbmr_n_foci``. Spelling it with no argument is what makes it unshadowable: there is no bare name for a user annotation to collide with, so no alias layer and no collision policy. ``exposure(column)`` carries a quantity of the user's own.

Conditioning changes what the model can estimate, and the two designs it makes meaningless are refused rather than fitted:

- A non-spatial term alongside ``exposure()``. Conditioning fits every total exactly, and such a term reaches the data only through the totals, so its score is identically zero and its estimate is exactly zero whatever the data -- which would still be reported with a standard error, and read as a confident null. The error names the two alternatives: ask the question spatially with ``s(z)``, or model the totals separately, where CBMR's coefficient for a non-spatial term is numerically identical to a count regression on the per-experiment foci count.
- ``NegativeBinomial`` and ``ClusteredNegativeBinomial`` with ``exposure()``. Both exist to absorb between-experiment variation in total count, which the exposure absorbs first, leaving the overdispersion pinned at its boundary.

``_intensity_pieces`` rebuilt the per-experiment weight rather than asking the predictor for it, so an exposure would have been present in the fit and absent from every closed-form information matrix while the autodiff fallback stayed correct. It now goes through ``CBMRPredictor.experiment_weights``, the single place the product is formed, and both overdispersed closed forms follow without further change because the exposure passes through their derivatives unaltered.

Also: the generated column goes into a copy of the annotations frame, since it depends on the fit's mask and incidence threshold and must not be left behind for a later fit to find; the deduplication key gains ``exposure`` so that ``~ s(g) + n + exposure(n)``, which is how a user asks whether the coefficient really is 1, is not read as a duplicate; the sandwich warns when its meat is rank deficient, which an exposure makes it by construction, one direction per spatial pattern.

Log-likelihoods are returned up to a constant that depends on the exposure, so they are comparable only between models sharing one. Documented in the module docstring and in ``poisson_log_likelihood``.

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

Add per-experiment exposure conditioning to CBMR formulas and propagate it consistently through estimation, inference, validation, and documentation.

New Features:
- Add formula support for fixed per-experiment exposures via `exposure()` and `exposure(column)`, including zero-valued derived exposures.
- Condition spatial CBMR estimates on experiment-level foci totals so spatial terms represent voxel distributions rather than rates.

Bug Fixes:
- Ensure likelihood, information matrices, covariance calculations, and overdispersed likelihoods consistently incorporate exposure weights.

Enhancements:
- Reject derived-exposure designs with non-spatial moderators or overdispersed distributions when conditioning removes the quantities they estimate.
- Improve validation and diagnostics for exposure terms, including contrast errors, rank-deficient sandwich warnings, and exposure-aware model descriptions.
- Keep generated foci-total annotations isolated to each fit and clarify that exposure-based likelihoods are not comparable across differing exposures.

Documentation:
- Document exposure semantics, estimands, validation rules, and likelihood comparability.

Tests:
- Add comprehensive parser, validation, fitting, likelihood, information-matrix, covariance, contrast, and end-to-end exposure tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2aab71dd4a80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.