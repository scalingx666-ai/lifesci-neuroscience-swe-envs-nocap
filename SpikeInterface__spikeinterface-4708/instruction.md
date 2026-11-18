# Issue

**Title:** Extract waveforms to zarr dataset

## Description

Adds mechanism to gather waveforms directly to their final location as they ar compute in `zarr` format.

This is the last piece to make `zarr`-backend computations fully on disk, when lazy

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2750986478b2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.