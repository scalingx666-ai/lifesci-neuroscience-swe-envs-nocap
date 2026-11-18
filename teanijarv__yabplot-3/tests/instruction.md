# Issue

**Title:** Mesh creation module

## Description

See email for details, but this is my proposal for refactoring some of the utility functions into a dedicated mesh-building module, with the ultimate goal of having users (1) build meshes, then (2) pass those meshes to plotting functions along with their data, instead of having key-value pairs for all bmesh objects.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c8c6bd5fb63`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.