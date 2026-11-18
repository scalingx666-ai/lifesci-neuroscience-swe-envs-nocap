# Issue

**Title:** #623 Speed up and unify lcov coverage capture

## Description

Addresses the configuration part of #623 

See  for the faster XML parser

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f5fed888fe01`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.