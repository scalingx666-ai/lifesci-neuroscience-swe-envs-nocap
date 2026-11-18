# Issue

**Title:** fix(server): Set publication year on DOI updates based on snapshot date

## Description

Use the snapshot creation time instead of the current date for publication year in DOIs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62dcd904969c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.