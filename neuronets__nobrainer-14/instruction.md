# Issue

**Title:** ADD+FIX: aparcaseg + multi gpu support; fix epochs bug

## Description

This PR adds support for training on multiple GPUs and fixes a bug where training would not run on multiple epochs (the data generator could only be used once).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ebdbc909b00`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.