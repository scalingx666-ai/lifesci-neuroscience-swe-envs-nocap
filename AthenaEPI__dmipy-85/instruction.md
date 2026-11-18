# Issue

**Title:** FIX: pass scheme to call of MultiCompartmentSphericalHarmonicsModel

## Description

This commit changes the behaviour of the `simulate_signal` and the `__call__` function of instances of the
MultiCompartmentSphericalHarmonicsModel class by changing the
`_construct_convolution_kernel` method.

Before this commit, the acquisition scheme employed by the method was
the one contained in the `self.scheme` attribute. After applying this
commit, the employed acquisition scheme is the one passed as the keyword
argument `acquisition_scheme=` to the method. If it is not passed, the
function will use the one contained in `self.scheme` for backward
compatibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77064094b41e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.