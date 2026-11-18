# Issue

**Title:** Merge maint/0.3.x into master

## Description

These look like good changes that weren't merged into the current master. I had based my fix for #325 on this branch, for back compatibility purposes, and was surprised to find commits in here but not in master.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6ec11ab12e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.