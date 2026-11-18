# Issue

**Title:** deps(server): Drop deprecated "request" library

## Description

Drop the deprecated request library from the server since it was only used in one place and superagent works fine here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d5352700c9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.