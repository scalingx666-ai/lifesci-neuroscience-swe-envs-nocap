# Issue

**Title:** MAINT: Remove stochastic hard dependency

## Description

Looks like it's only needed for doctests, so move to `doc` dependency where I think it will be used

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98970eb01277`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.