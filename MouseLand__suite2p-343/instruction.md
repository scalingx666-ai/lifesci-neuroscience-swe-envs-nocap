# Issue

**Title:** Clean install: travis & rtd compatibility, conda and pypi integration

## Description

Hi, 

This pull request contains fixes for a lot of dependency conflicts between services and installation processes.  It documents versions of dependencies that produce build errors, moves preferences for installation to pypi (except in PyQT5 and in specific versions of mkl_fft), and documents alternate installation modes for testing, documentation, and gui installation where necessary.  Because everything is in setup.py, it also keeps the update path working (pip install --upgrade suite2p), even in cases where most dependencies change.

Best wishes,

Nick

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `925fa4554ce6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.