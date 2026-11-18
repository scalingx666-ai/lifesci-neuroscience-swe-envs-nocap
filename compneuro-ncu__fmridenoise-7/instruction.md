# Issue

**Title:** Added quality measures interface

## Description

This PR adds an interface to obtain basic quality measures, including:

- correlation of edges' weight with mean FD
- temporal degrees of freedom loss

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c16c3458b350`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.