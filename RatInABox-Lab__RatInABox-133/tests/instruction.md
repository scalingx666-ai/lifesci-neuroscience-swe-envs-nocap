# Issue

**Title:** Fix bug where sigma_r was incorrectly set to sigma_angles instead of sigma_distances.

## Description

Thanks for the useful package! 

When plotting BVC receptive fields I noticed that changing the sigma of the tuning distances does not change anything on the plots. It looks like this is because, within the plot_BVC_receptive_field() function in Neurons.py, sigma_r is being set to sigma_angles instead of sigma_distances, so changing the sigma_distances has no effect on the plots.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92775c75cb3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.