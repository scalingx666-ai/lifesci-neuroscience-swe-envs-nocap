# Issue

**Title:** ENH: freeze dcmqi version to v1.4.0 in 5.8

## Description

This is needed due to new developments in dcmqi that will require a more recent DCMTK 3.6.9, while Slicer is currently on 3.6.8.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1b95e45d4c0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.