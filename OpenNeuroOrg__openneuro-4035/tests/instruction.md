# Issue

**Title:** fix(cli): Wait for git worker to be ready before sending commands

## Description

Add a ready message to make sure the worker has constructed before sending messages. The initial commands would sometimes be dropped because of delay executing the worker setup, this prevents the issue regardless of delay.

Adds steps to the worker test to make it easier to identify which part of the test is failing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17d1ddcd68e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.