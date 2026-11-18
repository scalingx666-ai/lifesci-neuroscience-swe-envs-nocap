# Issue

**Title:** Fixes to DBP outlier detection, external-software Docker build

## Description

Changes:

Bump internal-tools to v1.0.12; this fixes: 
- issue in DCANBOLDProcessing which caused outliers.mat files to not be generated, (this affected releases v0.1.3 through v0.1.5, all of which used Matlab R2016b)
- a broken link to the NeuroDocker ANTs install that is downloaded as part of the external-software Docker build

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d034c5c838a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.