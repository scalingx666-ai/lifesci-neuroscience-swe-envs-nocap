# Issue

**Title:** Inform the user when they supply just the weights in place of the full model

## Description

This PR improves the error handling when users provide only model weights instead of the full model in Cellfinder. Previously, users would receive a generic shape mismatch error, which did not clearly explain the issue or suggest a solution. This update enhances the error message, providing users with clearer guidance on resolving the problem.
#454

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de7e4a7596ef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.