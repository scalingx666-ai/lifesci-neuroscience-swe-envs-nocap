# Issue

**Title:** Added reference data option to ft_denoise_ssp

## Description

Added an option to ft_denoise_ssp for computing the SSP projector from the principal components of a reference data (for example, an empty room recording). The number of principal components to project out of the data was added as a cfg option. Added an option to select the channels that can be used, e.g., for applying to different sensor types or axes separately. Default is to use all channels. Also added a line (188) removing the desired balance before applying the montage to grad if the updatesens is true. Otherwise it ends up with two ssp balances containing the same information.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9cba8bcf3375`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.