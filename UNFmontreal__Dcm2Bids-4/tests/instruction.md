# Issue

**Title:** More BIDS-compliant task handling

## Description

One step closer to BIDS compliance by using the TaskName value in the sidecar to set the -task part of the file name. See commit 953229e for details.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29dba4393637`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.