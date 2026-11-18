# Issue

**Title:** Deprecate labs

## Description

This PR reflects the recent mailing list discussion on the `nipy.labs` subpackage and implements two preliminary steps towards removal of the nipy dependency on Lapack:

1) deprecate all `labs` modules that depend on Lapack: `bindings`, `glm`, `group` and `utils.routines`. It is up to Bertrand and Gael to decide about the status of their `labs` modules and preferred migration strategies, given that the said modules are Lapack-free.

2) disable linking with system Lapack by default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ca18c3a9f85`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.