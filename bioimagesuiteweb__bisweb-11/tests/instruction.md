# Issue

**Title:** AWS

## Description

AWS features without the file tree panel. Note that this merge also includes a small fix to the file server for a bug that would occur when entering passwords.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca4ea1d31811`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.