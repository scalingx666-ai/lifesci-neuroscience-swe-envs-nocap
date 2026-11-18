# Issue

**Title:** [login] Adding reset password email translations

## Description

## Brief summary of changes
- Added the translations for `lost_password.tpl`
- Fixed bug where entering new generated password always returned "Expired password" message

Priority High given the bug blocks users from entering their new generated password successfully.

#### Testing instructions (if applicable)

1. Setup your environment to receive emails
2. Go to login
3. Change the language
4. Click on reset password
5. Ensure you got the email and that it is translated
6. Ensure that the new generaed password works in login

#### Link(s) to related issue(s)

* Resolves   (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3740f1a6496d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.