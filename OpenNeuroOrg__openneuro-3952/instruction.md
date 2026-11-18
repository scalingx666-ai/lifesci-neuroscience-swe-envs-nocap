# Issue

**Title:** fix(cli): Log server side push failure messages

## Description

The server can provide useful error responses for git pushes and these are currently lost. Logging them allows a user to debug a per-receive rejected push.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2dcc49f5235f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.