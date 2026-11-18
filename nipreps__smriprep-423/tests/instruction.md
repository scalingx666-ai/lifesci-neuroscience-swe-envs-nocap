# Issue

**Title:** CI: Small cleanups to GHA

## Description

Merge commits often break the `[skip ci]` check. Also the test logs are full of complaints about missing `FSLOUTPUTTYPE`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dc98e062acb0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.