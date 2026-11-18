# Issue

**Title:** MRG: refactoring setup.py to fix sdist etc

## Description

python setup.py sdist was broken, because I wasn't adding some files to the
MANIFEST.in, and because I wasn't correctly using the numpy build_py command.

In other news, it was annoying to have to install sympy etc to run python
setup.py egg_info, which was in turn required when installing via pip - see
gh-320.

Fix both of these by dropping checks for Mayavi and Cython, dropping
nibabel/nisext dependency (by copying code and refactoring), and letting
setuptools take care of dependency checking for missing packages.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `82e221666ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.