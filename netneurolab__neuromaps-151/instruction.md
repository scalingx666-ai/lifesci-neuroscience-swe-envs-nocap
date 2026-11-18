# Issue

**Title:** [ENH] Add tempdir argument for vol nulls

## Description

This PR adds a `tempdir` argument to the null model functions that accept
volumetric maps (`burt2018`, `burt2020`, `moran`). This argument
specifies where the temporary distance matrix file should be stored when
the user generates volumetric nulls without parcellation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a4fb99679562`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.