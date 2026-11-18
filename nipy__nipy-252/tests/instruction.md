# Issue

**Title:** Old numpy compat

## Description

On checking, it turned out we were using some very small features of later numpies than 1.2 - our stated dependency.

These very small fixes make it possible to run with numpy 1.2.  Although 1.2 is now very old, the fixes are so small that I think they are worth putting in.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `50583f161d23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.