# Issue

**Title:** Fix/Default chunksize

## Description

* Fix: default `chunksize` is now `2s` such that BOLD can be downsampled properly
* Fix: `bold` model gets reinitialised when model is rerun.
* Fix: `bold` model only runs when chunksize is a multiple of `2s`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c77e2c9b483`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.