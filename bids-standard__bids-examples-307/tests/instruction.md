# Issue

**Title:** [ENH] Microscopy: Add photos and associated JSON files

## Description

This PR adds photos to the `micr_SEM` and `micr_SPIM` datasets following the addition of a new JSON file associated with microcopy photo files in:

- 

Still WIP as the spec PR is not approved yet.

The validation steps are implemented in the validator:

-

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f76f7782f98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.