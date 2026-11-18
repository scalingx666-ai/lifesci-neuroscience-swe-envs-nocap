# Issue

**Title:** BOLD initialization : avoid divide by zero with default params

## Description

When using `simulateBOLD()` externally with default initialization, the `F` vector is set to zeros, which throws a division by zero error down the line in numba. 
This can be avoided by setting F with a small epsilon before using it in the calculation of other state variables.  
Might be related to issue #250.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec2434ecd280`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.