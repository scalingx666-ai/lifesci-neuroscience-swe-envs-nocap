# Issue

**Title:** Fix study multiprocess error

## Description

This was due to pydantic only partially loading Study as a first step

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b64476b9380f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.