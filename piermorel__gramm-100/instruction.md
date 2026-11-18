# Issue

**Title:** Added string support and setylim for stat_smooth

## Description

I tested it and I don't think this breaks anything.

Two changes:

I copied setylim from stat_summary into stat_smooth so it works for both

I added string support to unique_and_sort.m so you can have string variables as well as categorical and cells. Might be able to add this to unique_non_nan.m but I don't know enough about it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b0fc59245c17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.