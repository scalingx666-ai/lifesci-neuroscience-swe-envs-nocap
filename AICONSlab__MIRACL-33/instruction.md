# Issue

**Title:** Merging changes to the STA workflow, as well as fixes to the registration workflow

## Description

- TIFF to NII now appears when using GUI
- Modified GUI for "check registration results" to be able to select the same options as in the command line interface
- STA workflow now allows users to input multiple values for degree of gaussians, sigmas, and angles 
- fixed bug that caused registration pipeline to fail at last step (function call to `CreateTiledMosaic`)
- reduced runtime of `miracl seg voxelize`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7111b3b1f776`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.