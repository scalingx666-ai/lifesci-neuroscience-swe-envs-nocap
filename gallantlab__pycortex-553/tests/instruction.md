# Issue

**Title:** MNT Remove dependency on distutils

## Description

This should remove any explicit mentions of `distutils` and fix installation in Python 3.12.

I'm not super familiar with the packaging system, so there's 2 things I'm not sure about:
 * Does anything else need to be done to address #538 ?
 * Does setuptools still need to be pinned to `<60.0` ? It looks like this was done to fix #552, but the [NumPy migration docs](https://numpy.org/doc/stable/reference/distutils_status_migration.html#interaction-of-numpy-distutils-with-setuptools) suggest this is only if you're using `numpy.distutils` (which this PR removes).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `97370bed21a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.