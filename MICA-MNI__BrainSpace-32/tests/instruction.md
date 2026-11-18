# Issue

**Title:** [ENH] Added gzip support to read_surface

## Description

This PR lets `read_surface` read gzipped files. Unit tests are updated to include .gz files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4f4dc5f6e90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.