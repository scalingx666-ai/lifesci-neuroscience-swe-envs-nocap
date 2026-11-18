# Issue

**Title:** chore(deps): Bump minimum indexed_gzip

## Description

This should fix the minimum dependency build.

It appears there was a bug in tox that prevented indexed_gzip from being
installed in this environment for some time. Now that it's fixed, it turns
out that version of indexed_gzip only has wheels up to Python 3.9.

1.9.1 is the first version less than three years old, which should be a
wide enough compatibility window.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0670ae6ff429`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.