# Issue

**Title:** fix: Remove Marie Curie from contributors

## Description

This got caught up in the mass update from #1964. It broke Zenodo because they can't take a joke.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8fd451a90f9d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.