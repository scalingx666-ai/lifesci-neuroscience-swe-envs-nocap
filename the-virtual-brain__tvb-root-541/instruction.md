# Issue

**Title:** Fix warnings in library

## Description

A bunch of warnings crop up when running pytest on the library.  These include

- deprecation warnings of use of NumPy aliases like `bool`, `int`, `float` and `str`, which I replaced with concrete data types
- test model classes starting with `Test` are seen by pytest as unit tests but warns that it can't initialize them because they implement `__init__`, so I renamed them to `ModelTestBlaBla`
- one numerical test had no `atol`, fixed generously at 1e-3

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c6ce99fe75b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.