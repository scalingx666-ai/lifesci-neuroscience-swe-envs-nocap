# Issue

**Title:** Make test for presence of max_path in partitions not run for current psutil 6.0.0

## Description

See  - reporting of max_path was removed

Should fix our CI which just turned red

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a537cdbe8a16`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.