# Issue

**Title:** [ENH] New stats functions

## Description

Adding some new stats functions. Most of them are numba-optimized, but also works without numba. 

They'll ultimately be part of Andrea's toolbox. 
I'm putting the alpha versions here so we can test them & be early adopters. 

- network_pearsonr
- network_pearsonr_numba
- network_pearsonr_pairwise
- effective_resistance
- network_polarisation
- network_variance
- network_variance_numba
- network_covariance
- network_covariance_numba

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b6bde612174`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.