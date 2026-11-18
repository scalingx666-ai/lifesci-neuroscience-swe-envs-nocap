# Issue

**Title:** Fix: use public figshare url to download files

## Description

This fixes the regression test failure on non-ucl networks.

@pzeidman

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24dc599d3eef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.