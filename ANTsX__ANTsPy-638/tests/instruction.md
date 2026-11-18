# Issue

**Title:** Ants read warp transform

## Description

Related to #636, allow the read_transform function to read displacement fields.

Also added checking for the `transform_from_displacement_field` function, so that a meaningful error is raised if the image does not have the correct number of components.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c812984096b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.