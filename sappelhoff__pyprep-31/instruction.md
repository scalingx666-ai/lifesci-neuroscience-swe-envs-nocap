# Issue

**Title:** Give each class a random_state param to pass around to methods

## Description

This should fix our random tests to a certain seed so that they consistently pass according to our expected outputs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61efb9ced684`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.