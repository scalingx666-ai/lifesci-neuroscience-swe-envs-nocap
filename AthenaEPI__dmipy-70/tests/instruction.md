# Issue

**Title:** FIX: change use of print for py3 compatibility

## Description

In dmipy.utils.spherical_mean `print` is used as a statement, which is
not compatible with python 3.

This PR fixes it and now `print` is used as a function.

This PR solves issue #69 .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac9aa3141d64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.