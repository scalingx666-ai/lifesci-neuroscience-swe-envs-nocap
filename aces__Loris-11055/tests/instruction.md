# Issue

**Title:** [login] Fix reset password bug in French (non-ASCII characters)

## Description

## Brief summary of changes

This PR fixes the multilingual password reset bug described in the issue, where users could not receive password reset emails when their language preference was set to French. The problem was caused by the email subject containing non-ASCII characters without being properly encoded. Since the subject is an email header, it must be encoded before being passed to the mail() function (at the end of `Email.class.inc`). This PR fixes the issue by encoding the subject using `mb_encode_mimeheader()` before sending the email.

#### Testing instructions (if applicable)

1. Please follow the instructions described in the corresponding issue.

**Prerequisite:** Ensure the user account being tested has a valid email address configured. If necessary, update the user's email in the database:

```sql
UPDATE users
SET Email = 'user@example.com'
WHERE UserID = 'username';
```

#### Link(s) to related issue(s)

*  (Reference the issue this fixes, if any.)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4e076bc38ec5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.