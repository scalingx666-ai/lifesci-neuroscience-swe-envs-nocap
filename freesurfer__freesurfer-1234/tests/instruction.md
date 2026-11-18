# Issue

**Title:** moved AANSegment volumes txt file to /stats/.stats

## Description

Added line to move the arousalNetworkVolumes.${SUFFIX}.txt outputted in /mri over to the /stats directory as arousalNetworkVolumes.${SUFFIX}.stats. 

mkdir -p .../stats/... is there just in-case one runs the script without recon-all. 

The name arousalNetworkVolumes is hard-coded since its name is created in downstream code. I will change this when we convert to python.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a6bdbef2075`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.