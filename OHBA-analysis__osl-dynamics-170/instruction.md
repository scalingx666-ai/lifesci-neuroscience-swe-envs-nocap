# Issue

**Title:** Separate method to get instantaneous covariances.

## Description

Previously we simulated instantaneous covariance when we generate data in `HMM_MVN`, `MixedSine_MVN`, etc simulations. This is memory inefficient because most examples don't use the instantaneous covariances.

Here, we separate the generation of the instantaneous covariances into a separate method.

I removed the normalisation of the instantaneous covariances from the `.standardize` method. Because `.get_instantaneous_covariances` the method will use the latest covariances, which will be standardized if we called `.standardize`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eddd3bf89c01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.