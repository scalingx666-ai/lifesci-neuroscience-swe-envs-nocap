# Issue

**Title:** feat: Validate datasets by git reference (uses @bids/validator 3)

## Description

First commit bumps versions to ensure there's no breakage. Second adjusts import paths.

I can go ahead and address #3921 in this or save it for a different PR.

I would suggest waiting to merge until after the full 3.0 release, but I wanted to test this before making the full release. I'm not sure if there is additional validation beyond CI before we should go ahead.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ffc0bdbe1ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.