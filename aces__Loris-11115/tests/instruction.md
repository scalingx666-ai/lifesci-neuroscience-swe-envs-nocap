# Issue

**Title:** [dasboard] Add missing French translation

## Description

## Brief summary of changes

This PR adds the French translation for the string 'No open tasks for you.'.

#### Testing instructions (if applicable)

1. Go to 'Admin' -> 'User accounts'
2. Click on 'Add User'
3. Create a new user (no assigned tasks) so that this message is displayed.
4. If you can’t log in, set Pending approval to No.
5. Log in to the new account.
6. Verify that the translated message appears in the top right corner.

<img width="1708" height="869" alt="image" src="https://github.com/user-attachments/assets/ed5202e4-b4f2-43bd-89be-bb604d4f507a" />

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7e198349459`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.