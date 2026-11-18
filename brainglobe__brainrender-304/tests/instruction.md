# Issue

**Title:** fix some vedo function calls still using lowerCamelCase instead of snake_case

## Description

6a7ca30 should have probably updated `centerOfMass` to `center_of_mass` in the whitelisted attributes of `Actor.__getattr__()`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f702cbc092b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.