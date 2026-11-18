# Issue

**Title:** Document current best e2e model and save to stability wandb

## Description

- Run the current best baseline model on the Stability cluster with a val batch size of 300 as suggested by @Atom-101 and save samples to Stability's wandb. (NCE loss for all epochs, no mixco).
- Document e2e model in the README, including wandb run from above (https://stability.wandb.io/jimgoo/fMRI-reconstruction-NSD?workspace=user-jimgoo)
- Add a simpler 3Dconv model without attention at the end, works about as well as the original 3D model in limited testing
- Add ability to pass 3D data to existing 1D models and have it flattened. Intended as a data sanity check but runs out of memory usually.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8dfc334aced6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.