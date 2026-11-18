# Issue

**Title:** Added shell wrapper for dissection_photo gui

## Description

Added a wrapper script as new entry point for the dissection_photo gui executable. Checks for model dependencies before calling the gui, so it doesn't fail half way through the process if they're not present.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `667ed0204384`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.