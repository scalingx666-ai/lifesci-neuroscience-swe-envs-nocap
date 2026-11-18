# Issue

**Title:** ENH: Rebased existing Bids branch to current master

## Description

This includes the following changes:

- ENH: modify subject dictionary
  - Subject dictionary now expects `subject` and `session` as keys in the dictionary
- ENH: renaming files to match bids specification
- ENH: modifying snake case file names to use camelcase w/ vim macro

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `093b8f1da988`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.