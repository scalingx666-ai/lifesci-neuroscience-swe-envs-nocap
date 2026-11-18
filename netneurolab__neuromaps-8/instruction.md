# Issue

**Title:** [FIX] Fix OSF info and json

## Description

Screwed up OSF token env variable name when migrating repository.

Also, fixes to `osf.json` tag formatting and other minor changes to `neuromaps.datasets._osf` functions for internal use.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef229ef6eea2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.