# Issue

**Title:** Delete user for issue #420

## Description

Added a new tab in the user control for account deletion, includes double check. Firstly I just did put a button and when pressed, the user and all his data was deleted. Then I realized that this is too dangerous, so I added a GitHub-like checking; the user should write his own username in order to delete the account.
This approach is just my solution, this "deletion" stuff must be taken with care, so maybe you would like to do it in a different way.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2472d8ce309a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.