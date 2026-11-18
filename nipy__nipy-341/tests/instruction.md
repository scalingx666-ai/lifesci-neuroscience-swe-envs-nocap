# Issue

**Title:** MRG: refactor, fix traxis build

## Description

Python 3 builds broken for travis - refactor using dipy as template to get
better handle on the problem.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d31366b2a858`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.