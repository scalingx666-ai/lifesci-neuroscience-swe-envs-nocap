# Issue

**Title:** Fix workflow, numpy install, and pytest bug in github action workflows

## Description

The reason is github workflow automatically install python 3.13, which has not been supported by numpy and other libraries. I changed the workflow script.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b7ed563e87a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.