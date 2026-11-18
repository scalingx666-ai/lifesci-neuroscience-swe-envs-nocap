# Issue

**Title:** prevent doc deployment by pushing to master

## Description

Will stop the documentation to be constantly updated unless the specific conditions are met.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d00aacdc3a31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.