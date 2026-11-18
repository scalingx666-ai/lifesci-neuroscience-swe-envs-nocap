# Issue

**Title:** put user-specified ops_classfile as highest priority, reduced branchi…

## Description

If the user specifies an ops_classfile, it will automatically be used.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aef89477683b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.