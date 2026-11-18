# Issue

**Title:** backed out change that blocks redisplay with overlay toggle

## Description

The December 2025 fixes for Mac Tahoe changes introduced a small change that broke the Overlay toggle in the AFNI GUI. Removed one check for func_visible to turn off checking that when turning off the overlay.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03cabe142cc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.