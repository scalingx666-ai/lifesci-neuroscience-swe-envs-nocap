# Issue

**Title:** Fix Brennan _download method to accept overwrite; Add nworker parameter to OpenNeuro

## Description

This adds support for the overwrite parameter. makes it compatible with a wip cli interface.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3b8b2da5bdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.