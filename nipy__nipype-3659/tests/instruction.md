# Issue

**Title:** Replace deprecated imghdr

## Description

The module will be removed from Python 3.13:
https://docs.python.org/3.13/whatsnew/3.13.html#pep-594-dead-batteries-and-other-module-removals

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ccec546c6944`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.