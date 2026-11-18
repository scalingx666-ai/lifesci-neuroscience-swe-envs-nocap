# Issue

**Title:** HBP-205 Replace usage of canvas.set_window_title

## Description

Use `canvas.manager.set_window_title` instead 
the previous form was deprecated and is now removed in Matplotlib 3.6

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cf45f75c79f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.