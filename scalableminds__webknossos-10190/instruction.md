# Issue

**Title:** Fix occasional token cleanup job sql deadlock

## Description

### Summary
Fixes harmless but annoying occasional sql deadlock stemming from multiple cleanup jobs locking the same rows of the tokens table.

### Issues:
- fixes https://scm.slack.com/archives/CMBMU5684/p1792325783980129

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49db03a45931`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.