# Issue

**Title:** Set up CI with Azure Pipelines

## Description

I set up a basic build for all three target platforms, anaconda on Linux and manylinux via docker on Azure Pipelines and so far I like it. It has a lot of rough edges concerning artifact deployment (no wildcards), cpack is broken on Windows and conda on Windows / macOS but sooner or later this'll work and we can get a nice badge.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ae6e1569212`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.