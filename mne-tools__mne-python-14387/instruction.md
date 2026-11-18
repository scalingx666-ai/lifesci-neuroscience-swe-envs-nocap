# Issue

**Title:** FIX: Validate SSP projections in Covariance algebra

## Description

#### reference issue

n/a

#### what does this implement/fix?

in `mne.cov._check_covs_algebra`, `projs2` was built from `cov1["projs"]` instead of `cov2["projs"]`:

```python
# Before
projs1 = [str(c) for c in cov1["projs"]]
projs2 = [str(c) for c in cov1["projs"]]
if projs1 != projs2:
    raise ValueError(...)
```

since both lists came from the same covariance, `projs1 == projs2` was always true, and the check never looked at whether `cov2` had matching ssp projections when doing `cov1 + cov2`.

this pr changes `projs2` to read from `cov2["projs"]`, and adds a test in `test_arithmetic_cov` that checks a `ValueError` is raised when adding covariances with mismatched ssp projections.

#### additional information

found this while reading through the covariance operations in `mne/cov.py`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `614fb79c5c72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.