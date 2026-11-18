# Issue

**Title:** Add Dockerfile (no changes to any source files)

## Description

Uses neurodocker to generate a Dockerfile recipe.

- [x] Added to the makefile:
  - [x] Recipe to generate Dockergile
  - [x] Recipe to build docker image
  - [x] Recipe to run test

Also updated: 
- Files containing Version info (this should probably be handled by a make recipe)
- Doc for users and developers regarding using the docker image.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f25bca87d3e6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.