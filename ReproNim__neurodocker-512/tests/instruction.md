# Issue

**Title:** Afni missing dependencies for suma

## Description

These dependencies prevent a crash of suma when changing the t-statistic slider in Fedora 35 (mesa-libGLw is the current suspect).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2f42e138900`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.