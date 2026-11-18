# Issue

**Title:** fixed some small GUI plot errors for traceview

## Description

- stops iterating up and down arrow key press counters when reaching either 0 or max(nChannels) to include in the plot view
- plots slightly wider ylim to include topmost channel

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03307142f574`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.