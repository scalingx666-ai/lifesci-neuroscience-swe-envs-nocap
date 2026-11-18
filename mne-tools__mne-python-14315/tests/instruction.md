# Issue

**Title:** Support custom diagonal source covariance matrix for inverse operator

## Description

Related to #8666.

Implemented support for custom diagonal source covariance matrix by adding `source_cov` parameter for `mne.minimum_norm.make_inverse_operator`. The motivation for this addition is to use `source_cov` to address the different densities of cortical and cerebellar meshes (output of the [CMB](https://github.com/johnsam7/ceremegbellum) package, related PR ) by setting prior source variances equal to the areas represented by each source.

I created draft implementation and tests with Claude Sonnet 5 and then manually refined them.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d91f0dd8827`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.