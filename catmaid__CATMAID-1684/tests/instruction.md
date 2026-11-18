# Issue

**Title:** Travis scripts: Reduce logging

## Description

Previously, set -x would log every line of the travis functions'
execution as well as the commands of interest. Now set -v is used, which
only logs the function definition, not the call.

I'll need to check the build logs to see whether this actually helps legibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ab382f18740`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.