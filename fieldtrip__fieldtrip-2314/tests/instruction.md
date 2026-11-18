# Issue

**Title:** export raw and timelock data to CTF dataset

## Description

This is desired for implementing BIDS derivatives for EEG and MEG, which are to be stored in a similar file format as the raw BIDS datasets.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f55efdeae85`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.