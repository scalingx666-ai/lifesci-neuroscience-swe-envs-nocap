# Issue

**Title:** fix event description when loading data with biosig

## Description

that pull request handles events in a more senible way. 

- when using mexSLOAD, the event handling is broken
- when using sload/sread/sclose, the user defined events (1-255) are not consistenly described, some get prefixed with "condition ..", others not. 

The this PR addresses both case.s

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1825fbc8a74b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.