# Issue

**Title:** [IO] Load kernel data

## Description

Hello, 

Those are minor fix to load nirs KERNEL data. Also remove the automatic computation of HbT as its not really usefull and can be confusing for users to see HbT even if its not present in their data. 

This PR also adds support for time-domain nirs (without importing additional moments for now as i dont know how to process them yet). 

Also fix unit for raw data (mV)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd079cfe2dcd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.