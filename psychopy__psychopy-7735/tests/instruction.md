# Issue

**Title:** BF: Made Mouse Component "new clicks only" specific to each Component

## Description

Because we were just using the variable `prevButtonState` for *all* Mouse Components, if you have 2 Mouse Components in your experiment, the second will use the same `prevButtonState` as the first so new clicks are discarded as not new.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `025ec79562cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.