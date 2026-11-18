# Issue

**Title:** fix: add assertion error message

## Description

Naked assertion without error message is really hard to debug for downstream applications. 

This PR adds some assertion messages to check sanity method

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23238ac17bee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.