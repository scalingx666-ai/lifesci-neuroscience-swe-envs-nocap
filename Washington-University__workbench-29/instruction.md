# Issue

**Title:** DOC: Changes flag explanation to "right".

## Description

The "-right-metric" flag documentation said "left" instead of "right".  I assumed this was a typo. This PR changes it so the doc now says that "-right-metric" refers to "metric for right surface".

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b63e5a033d2d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.