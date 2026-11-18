# Issue

**Title:** Update fmri_data.m to avoid rezip

## Description

Rezip to get back to .gz can be avoided in fmri_data if have original .gz (which we always should).

Fixes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f35bc20eb085`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.