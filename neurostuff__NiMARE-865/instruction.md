# Issue

**Title:** Clarify FWECorrector arguments

## Description

The `FWECorrector` was written generally, such that methods beyond bonferoni and montecarlo could be specified if an `Estimator` implements one.

However, as of yet no such alternate method is implemented, and this generic organization obfuscates the API for the `FWECorrector`, as its not clear what possible options are implmeneted by estimators for monte carlo correction. 

Here, I make this API more explicit by:

* Makes montecarlo and bonferroni only possible options for `FWECorrector`, instead of any possible  yet to defined method
* Sets `n_iters` to 5000 across the board (except MKDAChi2)
* Makes other `montecarlo` arguments directly available to `FWECorrector`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb19ff60e0b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.