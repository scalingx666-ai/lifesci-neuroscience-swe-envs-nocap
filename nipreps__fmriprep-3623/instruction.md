# Issue

**Title:** fix: avoid overwriting codecarbon output

## Description

This should be a single log message, not three, but the less we change in the LTS the better.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `467a29cef643`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.