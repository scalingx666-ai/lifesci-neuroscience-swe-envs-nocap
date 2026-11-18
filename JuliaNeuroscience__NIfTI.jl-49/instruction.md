# Issue

**Title:** Some basic house keeping

## Description

Changes:

* NIVolume and NIfTI1Extension don't need to be mutable
* use parsing functions instead of slower dictionary look up for converting header info
* use updated workflows for coverage tests

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e72842fb88fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.