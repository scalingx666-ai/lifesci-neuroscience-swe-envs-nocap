# Issue

**Title:** Variogram matching

## Description

This PR will add the variogram matching procedure described by Burt et al., 2020 (https://www.sciencedirect.com/science/article/pii/S1053811920305243). Currently, the dense version is implemented, but has not been adequately bug tested yet. The sampled version has not been implemented so far.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e795c435506`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.