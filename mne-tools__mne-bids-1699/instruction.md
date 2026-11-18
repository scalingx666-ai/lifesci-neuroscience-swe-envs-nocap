# Issue

**Title:** Fix corner cases and speed up BIDSPath creation

## Description

Reviewing a recent PR I found a few minor corner-case bugs. Fix them, and also speed up BIDSPath creation slightly. Changes drafted by Claude Opus 5.5 and reviewed by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2e861490b91`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.