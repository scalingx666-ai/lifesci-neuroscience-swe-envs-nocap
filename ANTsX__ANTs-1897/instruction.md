# Issue

**Title:** ENH: Fix tensor I/O for python

## Description

ANTsPy does not support a tensor pixel type, the code was causing segmentation faults. 

Updated to read/write tensor data from/to a pointer as a vector image.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `193e36eedbdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.