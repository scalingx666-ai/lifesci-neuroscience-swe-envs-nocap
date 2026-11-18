# Issue

**Title:** [ENH] optimize gclda and lda

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

make code faster with less numerical precision and using jit.

## Summary by Sourcery

Optimize GCLDA and LDA text annotation pipelines for performance and memory efficiency, introducing JIT-compiled numeric kernels and more efficient text/count handling while preserving model behavior.

New Features:
- Add JIT-compiled helper functions for Gaussian PDF evaluation, peak probability computation, spatial distributions, and Gibbs sampling steps in the GCLDA model.
- Introduce internal helper utilities for text preprocessing and vectorization that expose reusable document-term matrix generation for downstream models.

Enhancements:
- Refactor GCLDA initialization and sampling to operate directly on NumPy arrays with cached mask coordinates and sufficient statistics, reducing Python- and pandas-level overhead.
- Cache Gaussian precision matrices and log-normalization constants for topic-region distributions to avoid repeated multivariate normal evaluations during sampling and decoding.
- Replace repeated covariance recomputation in GCLDA with accumulation of region-wise sums and cross-products, enabling more numerically stable and efficient covariance updates.
- Refactor text feature generation into reusable helpers and use sparse document-term matrices directly in LDA, with configurable numeric dtype for improved performance and memory use.
- Optimize LDA topic labeling by using partial selection for top tokens rather than fully sorting all vocabulary weights.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61669ee13b8d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.