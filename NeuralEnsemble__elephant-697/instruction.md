# Issue

**Title:** Fix Nodejs deprecation for older Github actions

## Description

# Desc
Basically the title, refer [Github Deprecation Notice](https://github.blog/changelog/2025-09-19-deprecation-of-node-20-on-github-actions-runners/)

# Fix
Updated action versions to latest in build_wheels workflow. Rest of workflows already updated in #608.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c90ca8a7d4c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.