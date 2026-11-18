# Issue

**Title:** Adds spherical harmonics distributed model to MC approach.

## Description

- Adds SD3SphericalHarmonicsDistributedModel to use in MC-models.
- Allows optimization of kernels given fixed spherical harmonics coeffiients.
- Removes fit_s0_response function on MC-SH models - the responses are just used if you give them, no reason for double interface.
- fixes MC-SH predict function.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32f51742c223`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.