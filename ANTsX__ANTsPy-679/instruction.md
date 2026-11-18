# Issue

**Title:** ENH: Update cibuildwheel linux

## Description

manylinux2014 no longer working, probably due to Centos 7 EOL

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc46782b85f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.