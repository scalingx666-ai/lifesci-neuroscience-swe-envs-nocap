# Issue

**Title:** Fix manual labeling gui

## Description

Fixes issue with manual labeling functionality crashing due to outdated settings dictionary keys. First, requires #1216 to be merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6ed85fc81f4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.