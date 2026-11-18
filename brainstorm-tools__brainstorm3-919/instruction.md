# Issue

**Title:** SEEG: Add infinite homogeneous medium headmodel

## Description

Hello, 

This PR adds a very simple head model for SEEG that assumes an infinite medium with uniform conductivity (sigma). 

This is described in https://onlinelibrary.wiley.com/doi/epdf/10.1002/hbm.23127 (equation 4) with a tweak to limit instability close to the electrodes (eq 5).

Although I think we will slowly move toward more complex FEM models, having this simple model in Brainstorm will enable easier comparison of the different models. 


Todo: 

- [x]  Add option for the model: min_distance and conductivity
- [x] Test on volumetric head model

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `868d5d59e107`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.