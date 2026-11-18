# Issue

**Title:** Remove bash from script call

## Description

This hard-coded call to bash cases these commands to fail because bash expects the path to a script to run.

Since the script is properly installed and set executable during pip install, its available on the path directly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5badc47b34d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.