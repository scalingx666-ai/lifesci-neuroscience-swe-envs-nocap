# Issue

**Title:** FIX: showing multiple data layers

## Description

Previously `Brain` time-setters and `.add_data(remove_existing=True)` only affected the most recently added data-layer on each hemisphere.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `075de953ae46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.