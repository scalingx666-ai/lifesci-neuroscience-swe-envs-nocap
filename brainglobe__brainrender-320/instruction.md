# Issue

**Title:** Add explicit `brainglobe-space` dependency

## Description

See 

We also were not depending on `bg-space` in our pyproject but were saved by it's implicit fetch from `morphapi`, but now we will depend on `brainglobe-space` as an insurance.

New version upon merging will be 2.1.5.

Currently we are experiencing #322 which is a blocker. Investigating.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f305f0f9076`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.