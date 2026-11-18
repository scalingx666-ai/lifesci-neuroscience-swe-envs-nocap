# Issue

**Title:** CI: Update CircleCI machine image

## Description

Builds are failing because coverage uses f-strings in its `setup.py`, and we're working on Python 3.6 images. It's not worth pinning an old coverage with Py36 EOL at the end of the year.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d8ba3179a11d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.