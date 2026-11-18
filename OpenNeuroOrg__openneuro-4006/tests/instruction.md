# Issue

**Title:** fix(app): Shell quote URLs and filenames in generated download scripts

## Description

Minor fix for filenames with shell characters in them, single quote filenames and the URLs passed to curl in our generated download scripts.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61b08a73debe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.