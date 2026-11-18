# Issue

**Title:** fix(server): Add fallback for older DOIs in syncDatasetDois

## Description

Syncing would skip too many older DOIs that don't have a database model record. Add a fallback to check the DataCite API and create the missing database record.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1bafad06167`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.