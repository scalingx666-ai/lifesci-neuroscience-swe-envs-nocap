# Issue

**Title:** HBP-199. Move/add tests from tvb-multiscale to tvb-contrib

## Description

This PR also includes [HBP-200](https://req.thevirtualbrain.org/browse/HBP-200), which relates to running the tvb-contrib tests inside a Github Actions workflow.

EDITED: This PR was waiting for #602 otherwise builds will fail with the recent inclusion of tvb-contrib tests in the Github Action

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d0e459dc7d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.