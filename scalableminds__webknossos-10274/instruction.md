# Issue

**Title:** Remove Multica issue creation workflow

## Description

### Summary
Removes the `create_multica_issue.yml` GitHub workflow, which created Multica issues when an issue was labeled `ai-task`.

### Steps to test:
- Label an issue `ai-task` and verify no workflow run is triggered.

### Issues:
- none

------
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `29252a79833f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.