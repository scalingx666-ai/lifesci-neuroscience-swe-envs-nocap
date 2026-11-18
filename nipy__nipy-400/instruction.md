# Issue

**Title:** ENH: pass kwargs to imshow also for plot_anat

## Description

So that also anatomicals can be plotted with `interpolation='nearest'`, for example.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8d314978029`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.