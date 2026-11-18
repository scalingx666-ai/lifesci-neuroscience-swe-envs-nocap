# Issue

**Title:** TEST: Add sloppy MSM configuration for use in debugging/CI

## Description

MSM is taking ~30min to run on fMRIPrep CI. This adds a sloppy configuration that will hopefully reduce that dramatically.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37ad1c65a5fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.