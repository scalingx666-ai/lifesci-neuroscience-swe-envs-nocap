# Issue

**Title:** Fix Muse PPG package numbers

## Description

.

Write the decoded Muse PPG packet counter to the ancillary package-number channel for all six samples in each notification.

This mirrors the existing BGLib Muse implementation and keeps the current multi-characteristic aggregation behavior unchanged.

Validation:
- `git diff --check`
- focused C++11 syntax compilation of `src/board_controller/muse/muse.cpp` with the project include paths and warnings enabled
- verified the remote diff contains one two-line change

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e81b6a2e461`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.