# Issue

**Title:** Run scheduled tests on napari main

## Description

Adds an extra run of the neuroinformatics/actions/test with napari installed from main. This action will only run during the weekly cron job.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `091345fa9aef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.