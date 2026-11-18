# Issue

**Title:** fix mass univariate bug

## Description

`DesignMatrixLinearModel.events` was (wrongly) enforced to be a `DataFrame`. But in `UnfoldLinearModel`swith a subset of the events-table (e.g. you want to fit `:fixation` and `:stimulus` at the same time) we actually need a `SubDataFrame` to get later the parent's indices. 

This fixes this bug and explicitly allows `SubDataFrames` in the `DesignMatrixLinearModel`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7ec1ec10b36`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.