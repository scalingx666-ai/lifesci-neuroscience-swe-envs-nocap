# Issue

**Title:** fmrisim: Fix numpy.matlib import

## Description

Importing NumPy does not import the `matlib` module. It was implicitly
imported by SciPy, but this changed in SciPy version 1.2.0:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d931d6d8b7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.