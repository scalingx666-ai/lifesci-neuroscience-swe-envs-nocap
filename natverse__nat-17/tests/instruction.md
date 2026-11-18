# Issue

**Title:** Wrap connection clean-up in finally block

## Description

I don't really understand how this could have worked before, outside of the finally block, when it now requires placing inside it...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `778fd818e6af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.