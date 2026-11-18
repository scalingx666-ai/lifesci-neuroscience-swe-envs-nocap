# Issue

**Title:** equipotential surfaces through WM

## Description

made the basic functions to 1) solve a Laplace field and 2) translate surfaces inward along that field (maintining vertex correspondence)

TODO: 

- [x] make sure the input volume and surface are in the correct spaces
- [x] make sure the output is in space-nativepro and with the correct tesselation (fsLR-32K vs fsnative)
- [x] make sure in 2) that the number of iterations matches the desired depth

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `352e15a9ecb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.