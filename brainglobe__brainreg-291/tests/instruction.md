# Issue

**Title:** add atlas-version cli parameter and store atlas version in the output

## Description

tests are currently failing since the allen mouse atlas was updated on brainglobe atlasapi. after discussions with @IgorTatarnikov  we felt that the fact that brainreg could not store this in the output, and that it was not possible to provide atlas version as an argument was a barrier to reproducibility. 

This PR introduces this and pins the atlas version to 3.0 to match the existing test data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0e3bf3636a7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.