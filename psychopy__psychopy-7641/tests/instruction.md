# Issue

**Title:** BF: psychopy.app has moved to its own package psychopy_app

## Description

...but should this code be moved to that app package too? If calling psychopy.projects.pavlovia requires the app then lets put it in the app?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b42d7a283e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.