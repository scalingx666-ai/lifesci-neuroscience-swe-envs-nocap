# Issue

**Title:** Fix the Neumann BC in the x-direction of fixed step extracellular diffusion.

## Description

@nrnhines does this fix the problem you were having with conservation of mass?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17d85eb3bb0b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.