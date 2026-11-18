# Issue

**Title:** ENH: Add TRX File I/O plugin

## Description

Written with Claude code, but looks correct and works on simple cases

This uses the trx-python package to read and write TRX format data attempting to make a natural mapping between MRML concepts and TRX ones.

See the README.md file for more info.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80b08b5fa28a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.