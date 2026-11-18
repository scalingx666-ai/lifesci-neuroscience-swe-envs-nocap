# Issue

**Title:** fix for addcontrast bug (issue #395)

## Description

TA-suppled fix for addcontrast bug (in brief: aas_addcontrast was crashing when number of sessions in a BIDS dataset differed by more than 2). See issue #395 for discussion.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5039fe61ad8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.