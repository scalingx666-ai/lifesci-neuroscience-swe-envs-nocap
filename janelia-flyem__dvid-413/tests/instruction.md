# Issue

**Title:** Add /index-version to labelmap

## Description

New endpoint returns UUID of last time a label index was stored. Let me know if other endpoints need this kind of version information returned. @stuarteberg

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b9e6515348db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.