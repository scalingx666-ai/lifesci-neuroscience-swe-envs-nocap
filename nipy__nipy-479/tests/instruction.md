# Issue

**Title:** BF: change in np.prod upsets Formulae

## Description

As of Numpy 1.20, np.prod calls the __array__ method of input objects,
and this messes up Formula products.  Adapt and use basic sequence
product instead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `278d1e673d8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.