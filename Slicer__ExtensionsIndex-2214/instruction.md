# Issue

**Title:** Fix running of ai analysis on forks

## Description

No need to use a special environment for a free API key. Allow completing AI analysis in 2 minutes by increasing response per minute limit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd154d4e5212`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.