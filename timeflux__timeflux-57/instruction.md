# Issue

**Title:** Fix dejitter meta rate if rate from meta

## Description

Addresses #55 

Handles the case where rate comes from meta.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3205f00f1bde`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.