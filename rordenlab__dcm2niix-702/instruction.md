# Issue

**Title:** dcm2niix_fswrapper and libdcm2niixfs.a

## Description

1. set isForceStackSameSeries = 1 by default
  2. make adjustments for MGH bvecs output

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4c1e2b9e8ad6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.