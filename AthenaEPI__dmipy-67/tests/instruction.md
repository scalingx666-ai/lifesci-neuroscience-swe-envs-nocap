# Issue

**Title:** Small bug fix in signal_decay_metric

## Description

The mask in the signal decay metric is calculated as all voxels with b0>0. However, it can happen that the diffusion weighted signal is zero while b0>0. In line 221 (ratio = np.log(mean_b0[mask, None] / mean_dwi_shells[mask])), this leads to a ratio of infinity and the program breaks a few lines further down. This behavior can for example be seen in subject 118730 of the HCP dataset.

A possible solution would be the proposed mask, which also takes non-zero b-value voxels into account.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf9e0f0a2b1c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.