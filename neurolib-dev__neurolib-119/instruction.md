# Issue

**Title:** Exploration results to `xr.DataArray`

## Description

Simple convenience function to return all exploration results to `xr.DataArray`. The model coordinates follow the convention in `model.xr()`, i.e. dimensions "time", "output", and "space". In the MultiModel case, the dimensions added follow star notation, and the attributes then contain the full list of affected parameters.
Has optional `bold: bool` keyword - if True, return DataArray of BOLD model output, otherwise removes BOLD output if simulated and returns default model outputs.

Note: this PR is built on PR #118, hence I am opening this as a draft and will rebase once #118 is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bea2d8119865`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.