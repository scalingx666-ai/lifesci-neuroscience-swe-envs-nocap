# Issue

**Title:** Compute the CBMR observed information in closed form

## Description

information_matrix differentiates the log-likelihood twice with torch.func.hessian, which is jacfwd(jacrev(.)). Forward mode carries one tangent per parameter through the likelihood at once, so the intermediate log-intensity tensor has shape (n_parameters, n_patterns, n_voxels). On a 21-group diagnosis model over 21,789 voxels that is 28.7 GB: the model cannot be fitted at all, and the size is driven by the group count, so a coarser grid does not avoid it.

All three distributions admit a closed form, and it is the same shape in each case. The predictor is linear in the coefficients, so the chain rule contributes no curvature term and the spatial block is sum_p L_pc L_pc' (B^T Sigma_p B), with Sigma_p the second differential in the log-intensity. Only Sigma_p differs: diagonal for Poisson and NegativeBinomial, diagonal plus rank one for ClusteredNegativeBinomial, whose spatial coefficients enter only through the scalar sum_v exp(S_pv). Each is n_patterns rank-updates of width n_bases, so nothing of size n_parameters is formed. Automatic differentiation stays as the fallback for a distribution added without a derivation.

That exposes the next bottleneck: covariance() spent 163 s on an SVD for a diagnostic condition number against 14 s for the inverse it was diagnosing. The same L_pc L_pc' factor says which coefficients can covary, independently of the distribution, so the information matrix is exactly block diagonal for a cell-means factor and bordered block diagonal once moderators are added. covariance() now dispatches over that structure, and takes the condition number from a symmetric eigensolver rather than an SVD -- exact, since a symmetric matrix's singular values are its absolute eigenvalues. Every rung returns the same matrix and reports the same condition number; only the work differs.

marginal_by_pattern keeps a sparse foci sparse, since densifying it inside the routine meant to avoid large allocations would defeat the purpose.

Measured on the real 21-group pool, complete run including 20 one-versus-rest contrasts: 769 s and 5.49 GB peak before, 44 s and 2.67 GB after.

Every identity is proved symbolically at https://github.com/jdkent/cbmr-proofs (59 claims, each a residual simplified to exactly zero) and checked numerically against torch.func.hessian in the new tests.

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

Replace CBMR Hessian-based information and dense covariance workflows with closed-form, structure-aware computations that substantially reduce runtime and peak memory usage.

New Features:
- Compute observed Fisher information in closed form for Poisson, Negative Binomial, and Clustered Negative Binomial CBMR models, while retaining automatic differentiation as a fallback for unsupported distributions.
- Exploit block and bordered-block structure to accelerate Fisher covariance inversion and condition-number evaluation.
- Cache covariance matrices across repeated hypothesis tests for a fitted model.
- Preserve sparse foci inputs during pattern marginalization and experiment-total calculations.

Bug Fixes:
- Avoid memory-intensive Hessian intermediates and dense sparse-foci allocations that could prevent large CBMR models from fitting.

Enhancements:
- Add symbolic and numerical validation of information derivations, covariance routes, sparse/dense input equivalence, singular designs, and cache behavior.

CI:
- Relax benchmark regression detection to flag runs that are at least 20% slower than the baseline.

Tests:
- Add comprehensive tests comparing closed-form information with automatic differentiation across distributions and model designs.

Chores:
- Update CBMR benchmarks to reuse cached setup data and remove the obsolete diagnostics benchmark.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ce1c34d2c018`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.