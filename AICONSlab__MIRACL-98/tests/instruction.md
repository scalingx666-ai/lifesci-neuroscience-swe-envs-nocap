# Issue

**Title:** [fix] fetch, test and forward correct args to correlate fn

## Description

Bugfix: incorrect args were passed to `ACECorrelation.correlate()`. Static method fetches correct nifti files from `clust_final`, i.e. assigns absolute path to var, and checks if they exist. Raises error if False, otherwise args can be passed to `ACECorrelation.correlate()`.

Has been tested by invoking ACE interface manually with mock data but writing unit tests should be a priority for next PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2e3ab9605d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.