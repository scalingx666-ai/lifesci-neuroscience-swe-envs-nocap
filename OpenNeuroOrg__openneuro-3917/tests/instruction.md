# Issue

**Title:** feat(app): Enable public user profiles

## Description

Enable anonymous access to user profiles. Notifications and emails are hidden publicly. The default landing page is the user's datasets list but a subset of the account info tab shows imported or edited fields.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `164afdedb1ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.