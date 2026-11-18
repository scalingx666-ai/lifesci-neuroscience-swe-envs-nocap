# Issue

**Title:** fix 3dRSA OMP version to work with AFNI linux builder

## Description

Fixing OMP version for AFNI's linux_openmp_64 package. Appreciate @afni-rickr guidance as always!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca6cf70aca74`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.