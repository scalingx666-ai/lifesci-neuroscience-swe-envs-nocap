# Issue

**Title:** Add compute cluster measures (eg FA) from a volumetric map

## Description

Hi Lauren @ljod 

This code maps fiber clusters on a volumetric image (e.g. FA) and computes the mean, the max, etc. Also, it calculates the number of voxels and the volume size. I have double checked with comparison to the result form the LabelStatistics module in Slicer. They gave the same results. 

Regards,
Fan

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `06270b072d44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.