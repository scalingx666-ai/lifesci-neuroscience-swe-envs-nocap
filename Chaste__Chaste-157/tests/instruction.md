# Issue

**Title:** Auto docker image

## Description

This automatically builds a `chaste/develop` image after each PR merge / push which is tagged with the sha hash of the commit.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4501ac2ffef7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.