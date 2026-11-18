# Issue

**Title:** [REF] optimize kernels with compressed sparse row data representation

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

- replace COO with CSR
- optimize ALE speed/memory consumption by around 10x

## Summary by Sourcery

Standardize CBMA sparse representations on masked CSR matrices and optimize ALE/MKDA kernels and estimators around the new format for improved performance and consistency.

New Features:
- Support passing precomputed masked CSR modeled activation maps into ALE and MKDADensity estimators.
- Add helper utilities to convert between full-volume MA maps and masked CSR representations and to compute ALE statistics from dense or sparse inputs.

Enhancements:
- Refactor ALE, ALESubtraction, SCALE, MKDA, and KDA code paths to operate on study-by-masked-voxel CSR matrices instead of 4D COO arrays, reducing memory use and improving speed.
- Update kernel transformers so ALE and (M)KDA kernels emit standardized CSR sparse outputs and correctly handle array, sparse, and image return types.
- Adjust dataset generation and signal mask utilities to work with the new masked CSR kernel outputs.

Documentation:
- Update docstrings for CBMA estimators, kernel transformers, and MA computation utilities to describe the new CSR-based sparse formats and version changes.

Tests:
- Extend ALE and MKDA test suites with regression tests comparing masked CSR paths against dense reference implementations, including null histogram construction, summary statistics, and precomputed MA map handling.
- Add tests ensuring ALE-family estimators and custom ALEKernel subclasses use the masked CSR fast path and that MKDA kernels produce consistent dense and sparse outputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6e8fa5758c28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.