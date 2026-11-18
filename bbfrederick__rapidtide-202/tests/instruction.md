# Issue

**Title:** Dev

## Description

Changes proposed in this pull request:

- Makes significant internal changes to rapidtide and happy, pulling several functions out of the main routines into subprograms.  The eventual goal is to make the top level workflows much more flexible.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b1744eef968`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.