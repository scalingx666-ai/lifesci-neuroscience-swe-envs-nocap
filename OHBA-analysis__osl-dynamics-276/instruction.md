# Issue

**Title:** Sign Flipping

## Description

Closes 

Changes:
- Added method to the Data object to align sign across sessions.
- The user can specify a template covariance (or session data) to align all sessions to.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7c6ff0a11bf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.