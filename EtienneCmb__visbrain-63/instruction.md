# Issue

**Title:** Don't clean raw channel labels and fix/refactor rereferencing

## Description

Use channel labels as provided by user or loaded from data, without "cleaning", in ReadSleep

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `be152fdd6b90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.