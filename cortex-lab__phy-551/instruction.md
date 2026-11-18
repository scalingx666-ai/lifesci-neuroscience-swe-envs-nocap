# Issue

**Title:** [MRG] Fixed bug in phy script

## Description

The integration test has been removed -- it needs to be rewritten (generate a PRM instead of a KWIK).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b38ae751e3db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.