# Issue

**Title:** RF: Rework caching of internal data in `RigidBodyPose`

## Description

This PR reworks the `RigidBodyPose` class to have more efficient caching and matrix computation, and adds tests for the class. 

Also renamed parameter `alignTo` -> `v` in `alignTo()`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `782a1cc285e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.