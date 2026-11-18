# Issue

**Title:** Memmap bug

## Description

Fixed bug when downsampling a single channel (previously gave an array of zeros post downsampling).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1e2c75d8bcf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.