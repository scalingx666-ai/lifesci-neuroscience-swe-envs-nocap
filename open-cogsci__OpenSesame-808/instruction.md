# Issue

**Title:** Update backend.py

## Description

getargspec() is not available anymore on my python3.11 version so I get an "AttributeError: module 'inspect' has no attribute 'getargspec'."

inspect.getfullargspec(func) seems to be the replacement.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64f469b9b559`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.