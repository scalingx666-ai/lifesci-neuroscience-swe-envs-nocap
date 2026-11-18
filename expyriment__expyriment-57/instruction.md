# Issue

**Title:** Tags as version

## Description

This uses `git describe --tags --dirty --always` as version number. Revision number is thus obsolete.

@lindemann09 Let me know what you think.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09c5579e4d3c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.