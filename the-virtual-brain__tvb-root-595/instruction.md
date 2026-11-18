# Issue

**Title:** TVB-2513 CI: Adjust usage of cache

## Description

Inside Github actions, cache on python libraries should be invalidated when minor version of Python changes 
e.g. from Python 3.10.6 to 3.10.7

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dadb51327189`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.