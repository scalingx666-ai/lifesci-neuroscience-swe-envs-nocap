# Issue

**Title:** CI: Drop test for direct invocation of setup.py

## Description

Direct invocations of setup.py are discouraged by everybody including setuptools developers. The contemporary equivalents of these are pip installing, so let's just test those.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cff38381cdea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.