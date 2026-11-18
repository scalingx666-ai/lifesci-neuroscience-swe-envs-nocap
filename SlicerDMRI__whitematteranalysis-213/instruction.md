# Issue

**Title:** DOC: Prefer using `furo` theme for Sphinx documentation

## Description

Prefer using `furo` theme for Sphinx documentation.

Install the `furo` package as a pre-build step so that it is available for `readthedocs`.

Documentation:
https://pradyunsg.me/furo/quickstart/

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba9f379fecf0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.