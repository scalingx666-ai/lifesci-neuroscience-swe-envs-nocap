# Issue

**Title:** Delete old training data saves and warn user

## Description

- Deletes old training data when resaving to ensure that only the correct data is saved
- Warns users about this
- Tidies up the code base by using qtpy functions from brainglobe-utils

 

Requires  to be released and merged first

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `baa8b2d120ae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.