# Issue

**Title:** dev: Workaround for Theano NumPy incompatibility

## Description

Theano is not compatible with NumPy>=1.16. A fix exists, but it is not
yet part of a release. See:


As a workaround until the next Theano release, we can pin the NumPy
version we use, similar to Keras:

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `efce8ae9e463`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.