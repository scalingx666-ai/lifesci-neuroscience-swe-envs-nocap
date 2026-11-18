# Issue

**Title:** GLM tstats, hmrS_GLM

## Description

Major changes:

- Adding tstats per condition and per contrast for the iterative restricted maximum likelihood method from Barker, BOE, 2013.

- Adding hmrS_GLM which gets all run level data from a single subject and concatenates them. The new design matrix has HRF regressors common to all runs but have separate regressors for the rest of the model (e.g. drift, short separation).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10832b7ee859`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.