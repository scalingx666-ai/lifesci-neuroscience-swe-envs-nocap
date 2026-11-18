# Issue

**Title:** Fix error checking in selTournamentDCD

## Description

The fix made in #347 seems to be incorrect. 

It is not the case that k and len(individuals) must be divisible by 4. Rather k only needs to be divisible by four if k == len(individuals).

Additionally, k must be <= len(individuals) to avoid going out of bounds when indexing. 

This fix keeps the error checking correct while allowing us to use selTournamentDCD on an arbitrary number of individuals.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c7d45ddbfd91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.