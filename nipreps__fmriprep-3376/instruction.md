# Issue

**Title:** fix: Remove checks for unit zooms and symmetric rotations in template warp

## Description

A user with a custom template is generating warps that have spacing `[1.5 1.5 1.5]`: https://neurostars.org/t/use-custom-dartel-template-in-fmriprep/30670/8

The check for unit spacing was mostly intended to avoid weird behavior where we might generate a bad affine. The interpretation of isotropic spacing is straightforward, so I think we can relax this. Creating a docker image to allow for testing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `08933bf8bd39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.