# Issue

**Title:** WashU code changes for merging

## Description

This includes one substantial change (added OS X functionality to meminfo.m), a minor bug fix to second level contrasts, and the addition of a module providing access to M. Wilke's lateralization toolbox.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc35893f948f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.