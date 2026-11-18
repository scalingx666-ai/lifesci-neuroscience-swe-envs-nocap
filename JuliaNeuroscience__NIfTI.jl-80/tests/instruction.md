# Issue

**Title:** update package compats

## Description

I was running into issues with GZip when working with NIfTI on julia v1.12.0 and fixed it with these package compat updates.

Seems like the Project.toml has not been updated in a long time so this might be a helpful update?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `33dedf88071b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.