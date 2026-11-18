# Issue

**Title:** Remove appveyor config

## Description

I don't think we need it. If we want to keep using it, we should check that it is configured correctly:
https://ci.appveyor.com/project/nipy/nipy

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd297bd84012`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.