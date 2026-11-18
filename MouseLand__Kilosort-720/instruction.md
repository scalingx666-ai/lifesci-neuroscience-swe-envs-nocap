# Issue

**Title:** fix for cases in which filename contains string "ap" such as subject id

## Description

when subject names contain ap returns multiple binary files erroneously

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `018fe09ff06c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.