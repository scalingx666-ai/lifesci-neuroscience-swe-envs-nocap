# Issue

**Title:** [login] expand account request email

## Description

## Brief summary of changes

- Adds the selected project and examiner and radiologist choices to the account request email.
- Includes the requester’s real name and study title in the email subject.
- Normalizes submitted checkbox values so the email reflects the selected roles.

#### Testing instructions (if applicable)

1. Submit an account request with a project and both role checkboxes selected.
2. Confirm the email contains the real name, email, site, project, and “Yes” for both roles.
3. Confirm the subject includes the real name and study title.
4. Submit a request without the role checkboxes and confirm both values read “No”.

#### Link(s) to related issue(s)

*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b730a54a5bc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.