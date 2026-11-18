# Issue

**Title:** MRG: new numpy protects polynomial coefficients

## Description

New numpy returns a copy of the polynomial coefficients from poly.c,
rather than the actual coefficent array, so when we were modifying the
polynomial coefficients, the polynomial object wasn't seeing our
changes, leading to errors in the RFT module - see e.g.

https://nipy.bic.berkeley.edu/builders/nipy-py2.7-osx-10.10/builds/52/steps/shell_9/logs/stdio

Numpy issue raised on numpy-discussion mailing list.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d49e8292adad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.