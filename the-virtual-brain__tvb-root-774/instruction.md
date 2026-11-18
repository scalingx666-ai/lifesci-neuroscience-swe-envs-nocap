# Issue

**Title:** Enable numba backend for k ion ex model

## Description

This PR 

- extends the Numba backend for more complicated models
- adds requisite model metadata to the KIonEx model to allow for use with Numba backend
- based on the other numba dfun kionex PR which is currently open but soon to merge

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12f159c6cc93`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.