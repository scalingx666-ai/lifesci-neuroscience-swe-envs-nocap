# Issue

**Title:** BF + TEST: refactor fmri model inputs, add tests

## Description

FMRI model input checking is failing on python 3 because, in python 3,
strings have **iter** attributes, and were therefore not being put into
a single element list as intended.

Some whitespace and docstring edits.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60f351ae35cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.