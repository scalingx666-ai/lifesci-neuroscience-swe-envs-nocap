# Issue

**Title:** Store foci on CBMRModel

## Description

## Summary
- store the fitted foci matrix on CBMRModel when fit is called
- remove repeated foci arguments from model likelihood, information, covariance, standard-error, and contrast paths
- update CBMR tests for the stored-foci API and covariance cache behavior

## Tests
- python -m pytest nimare/tests/test_meta_cbmr_model.py -q
- python -m pytest nimare/tests/test_meta_cbmr_covariance.py -q
- python -m pytest nimare/tests/test_meta_cbmr_information.py -q
- python -m pytest nimare/tests/test_meta_cbmr_contrasts.py -q
- python -m pytest nimare/tests/test_meta_cbmr_exposure.py nimare/tests/test_meta_cbmr_formula.py -q
- git diff --check

Closes neurostuff/NiMARE#1118

## Summary by Sourcery

Make CBMRModel retain the foci used for fitting and use that state throughout fitted-model inference.

New Features:
- Store an immutable copy of the fitted foci on CBMRModel for reuse by downstream fitted-model operations.

Bug Fixes:
- Preserve the previous fitted state, coefficients, foci, and covariance cache when a refit fails.

Enhancements:
- Simplify likelihood, information, covariance, standard-error, and contrast APIs by deriving foci from the fitted model.
- Tie covariance caching to covariance options and invalidate it only after a successful refit.

Tests:
- Update CBMR model, information, covariance, contrast, exposure, and formula tests for the stored-foci API and refit/cache behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2eaf7628b9bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.