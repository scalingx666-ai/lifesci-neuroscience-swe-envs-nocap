# Issue

**Title:** 14 preflight check

## Description

Based on #17 , hence review #17 first

Add a small pre-run check if image shapes match default atlas shapes.
Log a warning if this is not true

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `30286839f2e7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.