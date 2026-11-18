# Issue

**Title:** improved robustness of figure plotting in main loop

## Description

1) make initial figure call responsive to user param ops.fig
2) put all figure plotting in try-catch so that plotting errors don't crash the sorting

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e247065c262`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.