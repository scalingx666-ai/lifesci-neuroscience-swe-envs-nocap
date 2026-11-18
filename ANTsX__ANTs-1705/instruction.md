# Issue

**Title:** COMP: Cancel previous ci builds

## Description

If multiple pushes are made to the same branch or PR, cancel prior CI runs

Avoids wasting time and also prevents dockerhub getting out of sync

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f7c20a579277`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.