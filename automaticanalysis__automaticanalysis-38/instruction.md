# Issue

**Title:** addsubject bug with length 2 strings

## Description

Hi Rhodri,

Without this added iscell check AA will assume that a string with length 2 (e.g. initials) is a cell and attempt to do mri/meg analysis.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfa5d39ba2c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.