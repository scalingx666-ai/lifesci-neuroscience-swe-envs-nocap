# Issue

**Title:** [ENH] Adds functions for working w/FreeSurfer's fsaverage

## Description

Includes minor dataset fetcher, updates to `plotting.plot_fsaverage()`, and a new center-of-mass calculation function to be used with `stats.gen_spinsamples()`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddfb47b974dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.