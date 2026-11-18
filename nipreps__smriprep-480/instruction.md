# Issue

**Title:** ENH: Integrate per-session processing

## Description

Continuation of #479

This breaks the current API so will need to ensure dependencies will be compatible. The plan is to work on this in the fmriprep side once tests are passing.

Remaining TODOs:
- [x] add session level support to `generate_report`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b839befd008e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.