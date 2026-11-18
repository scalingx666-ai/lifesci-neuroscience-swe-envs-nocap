# Issue

**Title:** FIX: Ensure that skippable components in Episode 6/7 can be skipped entirely

## Description

Some minor re-shuffling of code cells so that components in Episode 6/7 that may be skipped for the sake of time can be skipped entirely.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e16a996d58fa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.