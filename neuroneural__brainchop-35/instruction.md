# Issue

**Title:** Faster postprocessing

## Description

I have added code for connected components written by Chris Rorden for us. All other changes are to make it work with this new improved code. 

The acceleration for the light models is substantial: post-processing was taking 20% of the time. Right now it is very fast.

I've tested each model on M1 and M2 laptops, but more testing woudl not hurt

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ac115c81846`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.