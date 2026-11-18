# Issue

**Title:** Update SCM URL in MHubRunner.json

## Description

Updating to the original MHubRunner extension repo with the most recent version on the current stable release branch.
I already merged this change into main, I think I remember I also had to push it into version specific branches (if that's not or no longer the case, pls lmk).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d6e960be6e4f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.