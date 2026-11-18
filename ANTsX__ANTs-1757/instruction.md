# Issue

**Title:** BUG:  Manifold parzen windows.

## Description

Addresses 

The different likelihood functions (e.g., Gaussian, ManifoldParzenWindows) are generated from a list of samples.  For example, in the classic three tissue scenario, the voxels labeled as 'CSF' for the current iteration are fed into the first likelihood function which are used to estimate the likelihood function parameters (e.g., Gaussian mean).  When I first wrote this, once these parameters were estimated, the samples were no longer needed so I wrote a function to clear the input sample list immediately after likelihood parameter estimation.  However, this is no longer the case with the ManifoldParzenWindows, which relies on the Kdtree class which apparently needs to know the size of the input sample list during evaluation.    This pull request removes the deletion of the input list sample after parameter estimation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ebc7430177db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.