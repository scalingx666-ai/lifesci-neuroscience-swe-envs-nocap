# Issue

**Title:** Create helper function for plotting statistical maps

## Description

Closes none, but splits off part of #1478.

Changes proposed in this pull request:

- Add a function that controls all of the different stat map-based plots, except for component plots. This makes the formatting for all of them consistent.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `13b78cba777c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.