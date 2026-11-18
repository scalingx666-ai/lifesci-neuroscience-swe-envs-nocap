# Issue

**Title:** MAINT: Add github action to trigger tutorials for release branches

## Description

This is an effort to remove a manual step in the release process. 

Currently, we are submitting a PR to the tutorials repo to build from the current release branch.

This proposes a new action that runs whenever an upstream `rel/*` branch is pushed to that:
1) Triggers a "manual" dispatch to the tutorial's action
1) Tracks the status of the job until it i) succeeds, ii) fails, or iii) hits the timeout (currently 1 hour)

For this to work, it will require (cc @djarecka who may have the proper permissions):

1) ~ to be merged in~
1) A PAT for the nipype_tutorial repo to be created and added to this organization's secrets as `TUTORIAL_ACCESS_TOKEN`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71411b0ba6c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.