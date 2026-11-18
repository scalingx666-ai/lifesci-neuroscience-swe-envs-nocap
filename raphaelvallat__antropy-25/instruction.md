# Issue

**Title:** Improved sample entropy kernel

## Description

Closes:  

This PR adds the kernel proposed in #22. I will convert it from a draft once I finished writing a benchmark to verify that the numba version, too, improves the speed of the kernel.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9b9d43938449`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.