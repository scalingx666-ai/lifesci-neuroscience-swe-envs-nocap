# Issue

**Title:** Fixed "What's 2 + 2?" routing to weather

## Description

Fixed the issue reported in #55 and allowed + characters to be passed to the Google fact system.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e1b0f0cf9698`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.