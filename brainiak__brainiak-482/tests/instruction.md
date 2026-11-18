# Issue

**Title:** 2D expansion to IEM module

## Description

This is an initial PR so that the code co-authors can review it and make changes to the example notebook and docstrings.

Even if we only need minimal changes to `iem.py`, I still need to write many unit tests for the new code. I also have not done any final formatting checks using the shell scripts.

@mihaic, can you add @JamesWardAntony and @dhuberdeau as reviewers?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2cae27786913`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.