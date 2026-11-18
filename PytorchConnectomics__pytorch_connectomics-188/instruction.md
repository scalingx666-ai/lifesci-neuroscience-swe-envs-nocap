# Issue

**Title:** Milestone 3: extract runtime/checkpoint orchestration

## Description

Moves run-directory and checkpoint mutation logic into dedicated runtime module, preserving entrypoints.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `994c1fd147d4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.