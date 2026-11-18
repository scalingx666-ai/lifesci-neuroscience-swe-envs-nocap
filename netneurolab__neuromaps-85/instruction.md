# Issue

**Title:** [FIX] Fix wget dns issues in deploy-docs workflow

## Description

This commit fixes the wget dns failures we sometimes get when running
the `deploy-docs` workflow. I did as we did for the other two
workflows: added a while loop around the wget command.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53e005cba654`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.