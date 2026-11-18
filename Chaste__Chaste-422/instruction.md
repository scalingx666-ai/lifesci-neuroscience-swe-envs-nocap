# Issue

**Title:** 410 migrate to petscs packageconfig based cmake integration and improve mpi discovery

## Description

- [x] Modernise FindPETSc.cmake
- [x] Bump minimum CMake version from 3.16.3 (Ubuntu 20.04) to 3.22.1 (Ubuntu 22.04)
- [x] Modernise finding dependencies:
  - [x] PETSc
  - [x] HDF5
  - [x] MPI

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `547cbc5c5196`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.