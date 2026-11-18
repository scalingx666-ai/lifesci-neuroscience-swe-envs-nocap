# Issue

**Title:** Fix / Enhance: Implement sequence-based computation for the dual estimation

## Description

### Fix Memory Overflow in Dual Estimation of Covariances

Multiple users have reported a memory overflow issue when dual-estimating covariances from large datasets. The issue specifically occurs during covariance computation from the demeaned data matrix:
```
diff = x - session_means[state]
```

#### Solution

This PR implements a sequentialised approach to dual-estimation. Instead of computing the outer product of the entire data matrix at once, we segment the data time series into smaller sequences, reducing memory consumption during the calculation.

#### Impact

* This change affects only the HMM model.
* I validated that the sequentialised method produces identical results ot the original implementation.
* Tested on a simulated dataset of similar size to those reported by the users, the code no longer encounters memory overload errors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17e84e0c627f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.