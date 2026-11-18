# Issue

**Title:** Neo v0.10.0, remove support for python 3.6

## Description

In this PR the following changes are implemented to remove support for python 3.6.
This is neccessary since neo >=0.10.0 requires python >=3.7.
-  github actions
    - removed python 3.6 runner 
    - set MPI runner to python 3.7
    - edit `build_wheels` workflow set python>=3.7
- updated `environment-*.yml` files
- updated python version for travis CI
- changed `install.rst`: removed python 3.6 
- added python version requirement to `setup.py` (python >=3.7)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `67dd3f3ef861`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.