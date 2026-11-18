# Issue

**Title:** [Fix] deprecation warnings numpy 1.25.0

## Description

## Deprecation
1. The default behavior of `numpy.linalg.lstsq` will be changed, to fix this, set a parameter for `rcond`
  - set to `rcond = None` in granger
2. Conversion of an array with ndim > 0 to a scalar is deprecated, and will error in future. Ensure you extract a single element from your array before performing this operation.
 - fixed in gpfa, icsd, phase analysis 
3. changed import from `numpy.testing.utils` to `numpy.testing`
4. Comment out  example in doc string of icsd unittest, pytest is trying to run this as a docstest
5. replaced np.matrix with ndarray in KCSD

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7b581422437`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.