# Issue

**Title:** Dirichlet prior for the HMM transition probability matrix

## Description

Changes:
- Added an option to specify a prior for the transition probability matrix (`trans_prob`) in the HMM.
- Added `n_jobs` as an argument for `analysis.spectral.regression_spectra`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cea91517a7f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.