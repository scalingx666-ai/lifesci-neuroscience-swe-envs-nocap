# Issue

**Title:** Add concurrency cancellation to GHA workflows.

## Description

Hopefully this stops a single push to a pull request from double-running workflows.

In my other branch, it didn't seem to help. Maybe it only works if it's already on master? (there are some weird GHA things like that)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a509c1654ca6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.