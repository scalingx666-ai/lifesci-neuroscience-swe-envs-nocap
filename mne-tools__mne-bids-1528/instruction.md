# Issue

**Title:** ENH: read/write gzipped tsv

## Description

In order to support physiological data, MNE-BIDS needs to be able to read and write gzipped TSVs, which are headerless and must store their column names in a corresponding JSON sidecar file.

## Needs

- [x] #1531

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9ff7b74b093`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.