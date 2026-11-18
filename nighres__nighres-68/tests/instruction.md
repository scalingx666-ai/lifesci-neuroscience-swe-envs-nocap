# Issue

**Title:** Fix/autodoc mock

## Description

By mocking the import of cbstools in the doc/conf.py we can prevent the import error that occurs because of incompatible java installations. This makes the autodoc docstrings visible again in the online docs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `daaf54df4087`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.