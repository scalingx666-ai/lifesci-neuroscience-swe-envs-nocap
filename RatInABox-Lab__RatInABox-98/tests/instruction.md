# Issue

**Title:** Updated Environment to implement 1D objects for 1D environments.

## Description

Implemented objects for 1D environments (adding them to the environment and including them in the plots).
Added checks for parameters passed during environment initialization that do not apply to 1D environments (holes, walls).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `080b4b895463`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.