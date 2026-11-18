# Issue

**Title:** [REF] CBMR internal and public API refactor

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

- speed up CBMR and cache appropriately (many algorithmic improvements)
- correlate CBMA estimator methods with CBMR estimator methods
- make the public API for CBMR more easily consumable for users (add `infer` method)

## Summary by Sourcery

Refactor CBMR meta-regression and inference to operate at the experiment level, improve numerical stability and performance (including CUDA support and tensor caching), and strengthen reproducibility and test coverage.

New Features:
- Support running CBMR estimation and inference on CUDA devices with consistent device handling between estimators and models.
- Add deterministic seeding for CBMR model initialization and optimization to make fits repeatable.
- Introduce cached tensorized CBMR inputs and reusable Fisher information computations to support efficient multi-contrast inference.

Enhancements:
- Rework CBMR preprocessing to group by experiment IDs instead of study IDs and to keep experiment-level arrays aligned even when all foci for an experiment fall outside the mask.
- Improve coordinate validation and masking, including explicit checks for coordinate space consistency and safe filtering of out-of-mask coordinates.
- Clarify and standardize terminology and docstrings from study-level to experiment-level throughout CBMR estimators, models, and inference classes.
- Optimize B-spline basis construction to avoid sparse Kronecker products and build the masked design matrix directly for better performance and memory use.
- Refactor GLM estimators to manage tensor conversion/caching centrally, share data between fit and inference, and provide analytic Fisher information implementations for the Poisson model.
- Ensure CBMR inference copies results without mutating the input MetaResult and maintains internal caches for spatial and moderator covariance and log-intensity quantities.

Tests:
- Expand CBMR tests to cover deterministic repeatability of fits, CUDA-based fit and inference, description generation, and preservation of input MetaResult during inference.
- Add tests verifying that optimized summary table construction matches the legacy DataFrame-from-dict behavior.
- Add targeted unit tests for vectorized chi-square computation, Poisson multigroup log-likelihood, and agreement between analytic and generic Fisher information implementations.
- Add tests to ensure experiment-level grouping behavior (including experiments without in-mask foci) and that experiment IDs, moderators, and foci arrays remain aligned across groups.
- Adjust CBMR test dataset simulation parameters and randomization to keep tests stable and reproducible.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eec15b49f871`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.