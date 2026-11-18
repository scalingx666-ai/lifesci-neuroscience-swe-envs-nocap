# Issue

**Title:** Fix: remove type_checking from core

## Description

zarr is a core dependency and it is imported elsewhere, so there is really no need for this guard

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7e039941b0e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.