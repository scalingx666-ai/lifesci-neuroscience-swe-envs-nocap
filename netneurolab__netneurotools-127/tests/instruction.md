# Issue

**Title:** [FIX] Fix deprecation

## Description

Since `pkg_resources ` is going to be removed in Python 3.12, replacing it with `importlib.resources.files`. Currently it is not a perfect solution because `importlib.resources` is also undergoing substantial changes across version.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3faabb0f4a25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.