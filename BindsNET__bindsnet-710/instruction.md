# Issue

**Title:** Support Python 3.13

## Description

* Update dependencies to support python 3.13
  * removes support for 3.9
* improve cuda handling in deps with markers
* use temporary file in pytest to remove the permission error

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96479e6d8c21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.