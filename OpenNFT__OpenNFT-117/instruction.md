# Issue

**Title:** Migration to pathlib

## Description

Update:

- All _os.path_ methods were replaced with equivalent _pathlib_ package methods

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e27edf7e85f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.