# Issue

**Title:** Fix wrong randomness in ou process input

## Description

This pull request includes an important change to the `ou_process` function in the `brainpy/_src/inputs/currents.py` file. The change involves modifying the random number generation method used in the function.



* [`brainpy/_src/inputs/currents.py`](diffhunk://#diff-48229b57e1833772166fdba90935e4948007779bba6f4ddcfc82c59ba0637a32L309-R309): Changed the random number generation method from `rng.rand` to `rng.randn` in the `ou_process` function to ensure the generated noise follows a normal distribution.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a08ad4848c80`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.