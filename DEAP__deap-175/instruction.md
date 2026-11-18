# Issue

**Title:** Fixed bin2float behavior and added test suite for benchamarks.py

## Description

## Fixed bin2float behavior

A difference in integer division from python2 to python3 causes error when using bin2float.

In python2: `3/2` is `1` and in python3 `3/2` is `1.5`. The latter causes:
`TypeError: can't multiply sequence by non-int of type 'float'` in `in wrapped_function decoded = [0] * nelem`.

This pull request fix this error making this decorator usable in both python2 and 3.

## Added a new test file for benchmarks.py

This pull request also creates a test file for the benchmarks module.

## Other

Other files were also changed to comply with pep8.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b8c82186083`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.