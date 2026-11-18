# Issue

**Title:** CI: Push more wheels to pypi, document Mac compatibility issues

## Description

Wheels for Windows and Mac may as well go to PyPI in addition to the Linux ones.

Added a note to README about the Mac compatibility issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5f550b8dc42a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.