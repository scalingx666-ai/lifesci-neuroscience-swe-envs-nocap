# Issue

**Title:** MultiModel Chad-numba backend

## Description

A newer and shiny `numba` backend to MultiModel.
Before: 
- each new model parameters meant a new compilation since model parameters were directly inserted as floats into symbolic equations

Now:
- when using `numba` backend, all parameters are transformed to `sp.Symbol`, used function arguments for `numba`-jitted `integrate` function
- therefore when parameters change, no new compilation is needed

Apart from the new `numba` backend, I had to make some small changes to the existing code. In order to make this easier for you, I'll comment directly into the code below.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ded575a1bef5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.