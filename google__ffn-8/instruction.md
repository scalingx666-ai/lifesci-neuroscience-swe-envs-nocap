# Issue

**Title:** storage.py: Convert gfile.Open to use binary mode (py3)

## Description

Python3 needs the binary flag to open binary files so they're not read as strings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43552bbc2585`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.