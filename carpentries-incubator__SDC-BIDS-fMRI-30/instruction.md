# Issue

**Title:** ENH: Update Binder environment

## Description

Makes a few changes to the Binder environment:

- Binder will automatically download data from the first 3 participants in the download list (found in `postBuild`)
- automatically open within the code folder to prevent confusion about all of the carpentry-specific style files
- uses Jupyter Lab (has some helpful colour highlighting during tab completion)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5c5a15a7162e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.