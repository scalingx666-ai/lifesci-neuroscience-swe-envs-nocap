# Issue

**Title:** ABF loading optimization and improved support for variable-length sweeps

## Description

I'm working with pyABF and I noticed that the workflow was using some old versions.
Working with the code I also noticed that to transpose a matrix were done two distinct operations instead of one that is already implemented in the np library

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81d011d8df9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.