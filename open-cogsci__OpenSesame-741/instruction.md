# Issue

**Title:** Fix compatibility with Mac OS Big Sur

## Description

This sets the `QT_MAC_WANTS_LAYER` environment variable, which should hopefully fix compatibility with Mac OS Big Sur.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e01e9e5be2d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.