# Issue

**Title:** FIX: remove listfunc from `matrix_to_image´

## Description

This removes the function within a function that was potentially causes windows build errors. It should not change the functionality at all.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd2a4acafc9f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.