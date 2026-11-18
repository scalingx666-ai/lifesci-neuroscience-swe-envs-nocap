# Issue

**Title:** type: Avoid breaking third-party autodoc generation

## Description

Tools that depend on `bidsschematools` can have `_lazytypes` contents imported eagerly by autodoc. Guard some imports to avoid breaking people building with Python 3.10 or without all the optional dependencies.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca3ccde86c7a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.