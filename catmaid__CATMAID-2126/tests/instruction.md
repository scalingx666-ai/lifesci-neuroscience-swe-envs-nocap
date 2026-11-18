# Issue

**Title:** 3D viewer: add option to hide desmosome links

## Description

There was no way to show skeletons with only their synapses and no
desmosomes. Desmosomes were shown even when all skeletons were hidden.
This was making it difficult to make nice figures.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb5c41be8b96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.