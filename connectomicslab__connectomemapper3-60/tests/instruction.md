# Issue

**Title:** ENH: add options to BIDS App to fix multiple envvars

## Description

This PR adds new options to the BIDS App to gain more control on its execution in terms of reproducibility as suggested in https://doi.org/10.1016/j.neuroimage.2020.116889. 

This includes the setting of:
* the random generator seeds used by mrtrix (`--set_mrtrix_rng_seed`), 
* the random generator seeds used by ants (`--set_ants_random_seed`), 
* the number of threads used by ITK-based tools (`--set_itk_global_default_number_of_threads`)
* the number of MKL threads (`--set_mkl_num_threads`).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e962798dc44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.