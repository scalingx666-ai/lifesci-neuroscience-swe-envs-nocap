# Issue

**Title:** Dev1.2.2.5

## Description

- Fix the mismatch between SEPIA defined B0 direction and LPCNN when it is not along the z-direction
- Fix the shared library issue when using ROMEO with latest versions of Matlab on Linux (see [here](https://github.com/korbinian90/ROMEO))
- Allow user to define atlases' directory paths

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9083249b375c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.