# Issue

**Title:** chore: Drop Python 3.8 support

## Description

I'm starting to look at #1185, and I'm not particularly interested in supporting Python 3.8 while doing so.

Please close if you have a reason to continue supporting EOL Python versions.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `284cc3f08da9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.