# Issue

**Title:** New Triggers for workflow build_wheels

## Description

This PR will add more specific triggers to the build_wheels workflow.

Workflow is triggered if:
- push to master (equal to PR merged)
- approving review to a PR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7ee38e853ff`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.